# Why to use EnvoyFilter instead of WasmPlugin in Istio Gateway for Path Normalization
### Summary
After the retirement of nginx, the second recommended choice for routing was Istio, and after some architecture decisions we chose to go with Istio Gateway using HttpRoutes. But after the migration, we reached a state where we needed to also migrate our Grafana dashboards to the new setup, and since we should use some tool for normalizing the paths to avoid high cardinality in the metrics, we began our journey with WasmPlugin since it was the most known and was recommended in the community for such a case.


### What is the Problem with WasmPlugin?
When we tested the setup in our development environment, everything seemed seamless. The problem began after applying the setup in production. At first, we distributed the traffic between nginx and Istio gateways: 5% for Istio and 95% for nginx, and here is where the issue started. We found that Istio was consuming a huge amount of CPU compared to the percentage of the traffic it received. We made an analysis and found that the WasmPlugin was burning the CPU and taking a lot of resources for normalizing the paths, which was done by sequential checks on matched regex. So, taking it by numbers, in 5% traffic in Istio, it was a total of 10 pods, each pod between 2 ~ 3 cores, which was a lot compared with how nginx used to consume.


### One Other Chance for WasmPlugin
The first thing that came to our mind was optimizing the plugin so that, instead of making it run sequentially, we could group similar paths and terminate once matched and check only the group header. At first, this sounded like a great solution since in the worst case it checks the group header only + the members in that group, and by analysis it showed real, better optimizations. But unfortunately, after deploying this to production with the same 5%, it only reduced to 1.5 ~ 2 cores, which we still saw as a lot, so we wanted to find other solutions.

### Asking the Community
My manager said, "If you see yourself walking alone and facing issues that no one else is facing, then it's more probably you are on the wrong road." So we posted questions in the Istio Slack community and defined our problem, and they suggested that we could use either EnvoyFilter or Wasmtime, which is more performant than WasmPlugin.

### Starting from the Beginning --> EnvoyFilter
The transition from Wasm to EnvoyFilter surprised me so much. The performance was much, much, much better than expected, and it solved a lot of our issues.
### Current Design
Istio uses gateways ->> for each gateway there is 1 EnvoyFilter ->> for each gateway there is more than 1 service ->> each service has its own EnvoyFilter ->> and after compiling and applying in the cluster, all the EnvoyFilters for each service are combined together and form 1 huge file of EnvoyFilter that processes the services one by one. And if they all have the same priority, then they simply get organized alphabetically.
#### New Problems
After testing the EnvoyFilter in the development environment, we applied it in production and several problems happened. First, the Lua language does not support the heavy regex that we used in production, so we had to customize, filter/remove, and reshape the EnvoyFilter Lua script to transform these regex to something that Lua understands and works with.

Second, because we use Istio as a gateway, and by design each gateway has its own EnvoyFilter, and because there is more than one service in our product, eventually this gateway serves them all and all the regex for each service gets combined into one huge file of Lua code that processes the request sequentially by each service. We observed that some services that were alphabetically ordered before some other services had regex rules more generic than others, and by that, the requests from service C got matched with the general and least specific rules of regex of service A, because obviously it was ordered after service A. So the solution for that is 2 things: either fixing the general rules of the least specific paths in service A — and that requires more work from different teams — or solution B, which is to raise the priority of the services that have the generic rules. So by default the highest priority is 0, and any number above that has less priority, by the definition in the documentation.

Third, the problem we faced is not related to Wasm nor EnvoyFilter; it is because of the gateway design we implemented in the first place. Because the gateway is like one huge building block that serves all our services, if it fails, then all our services fail. So to solve this problem, we agreed on shifting to Istio service mesh instead of gateway.

### Sections with Images for Better Explanation
#### The Full Picture
#### What This Teaches
And by that, some action items we need to solve in the long term are:
- Fix our paths in our services
- Switch to service mesh instead of gateway
- Sync our development environment with our production one
- don't work alone, search and ask what others are doing better 
- - most of the solutions are solved if you just talk about them, asking for help is the most valuable thing here i learned, huge thank to my team