# Why to use EnvoyFilter instead of WasmPlugin in Istio Gateway for Path Normalization
### TL;DR:
- The Goal: Migrate our routing from Nginx to Istio Gateway and migrate our Grafana dashboards, using a tool to normalize paths and avoid high cardinality metrics.

- The Problem: WasmPlugin burned our CPU (2–3 cores per pod on just 5% of traffic) because it did sequential checks on matched regexes.

- The Solution: We switched to EnvoyFilter (with Lua), which was much, much more performant.

- The Catch: Compiling everything into one shared Istio Gateway created a huge combined EnvoyFilter file. This led to alphabetical regex collisions between services, making us rethink our gateway design entirely.

## The Migration and the Cardinality Problem
After the retirement of Nginx, the second recommended choice for routing was Istio, and after some architecture decisions, we chose to go with Istio Gateway with routing HTTPRoute resources.

After the migration, we reached a state where we needed to also migrate our Grafana dashboards to the new setup. Since we needed a tool for normalizing the paths to avoid high cardinality in the metrics, we began our journey with WasmPlugin. It was the most known tool and heavily recommended in the community for exactly this case.

## What is the Problem with WasmPlugin?
When we tested the setup in our development environment, everything seemed seamless. The problem began with high load of traffic a.k.a after applying the setup in production.

At first, we distributed the traffic between Nginx and our new Istio gateways: 5% for Istio and 95% for Nginx. This is where the issue started. We found that Istio was consuming a huge amount of CPU compared to the percentage of traffic it received. We did an analysis and found that WasmPlugin was burning the CPU and taking a lot of resources for normalizing the paths, which was done by sequential checks on matched regexes.

Taking it by numbers: for just 5% of our traffic in Istio, it took a total of 10 pods, with each pod burning between 2 to 3 cores. That was a lot compared to how Nginx used to consume.

(Insert your CPU usage comparison graph here showing WasmPlugin vs. Nginx)

## One Other Chance for WasmPlugin
The first thing that came to my mind was optimizing the plugin. Instead of making it run sequentially, we could group similar paths, check only the group header, and terminate once matched, so the time complixity would be O(log(M+N)) rather than O(N), where the N is the number of paths and M is number of group headers.

At first, this sounded like a great solution. In the worst case, it only checks the group header plus the members in that specific group. Our analysis showed real, better optimizations. But unfortunately, after deploying this to production with the same 5% traffic, it only reduced the load to 1.5 ~ 2 cores. We still saw that as a lot, so we wanted to find other solutions.

## Asking the Community
My manager said, "If you see yourself walking alone and facing issues that no one else is facing, then it's more probably you are on the wrong road." So we posted questions in the Istio Slack community, defined our problem, and they suggested we could use either EnvoyFilter or Wasmtime, which are more performant than WasmPlugin.

Starting from the Beginning: EnvoyFilter
The transition from Wasm to EnvoyFilter surprised me so much. The performance was much, much, much better than expected, and it solved a lot of our issues.

(Insert your benchmark results/graphs here showing the performance difference between WasmPlugin and EnvoyFilter)

## Current Design & New Problems
While the performance was great, the setup introduced new headaches. Here is how our design works:

- Istio uses gateways.

- For each gateway, there is 1 EnvoyFilter.

- For each gateway, there is more than 1 service.

- Each service has its own EnvoyFilter.

After compiling and applying this in the cluster, all the EnvoyFilters for each service are combined together to form one huge file of EnvoyFilter that processes the services one by one. If they all have the same priority (the default is 0), they simply get organized alphabetically.

After testing the EnvoyFilter in dev, we applied it in production and hit three distinct problems:

1. Lua Language Limitations
First, the Lua language does not support the heavy regex that we used in production. We had to customize, filter, remove, and reshape the EnvoyFilter Lua script to transform our regex into something that Lua understands and works with.

2. The Alphabetical Regex Collision
Second, because we use Istio as a shared gateway, the regexes for all our services got combined into that one huge Lua file. We observed that some services (let's call one Service A) were alphabetically ordered before others (Service C). Service A had regex rules that were more generic. By default, the requests meant for Service C got matched with the general, least specific rules of Service A, simply because A came first in the alphabet.

The solution for this was either:

- Option A: Fix the general rules of the least specific paths in Service A (which requires more work from different teams).

- Option B: Raise the priority of the services that have the generic rules. Any number above 0 has less priority according to the documentation, so we could force specific services to be processed first.

3. The Gateway Design Itself
Third, the problem we faced wasn't actually related to Wasm or EnvoyFilter; it was because of the gateway design we implemented in the first place. Because the gateway is like one huge building block that serves all our services, if it fails, then all our services fail.

(Insert your architecture diagram here showing the Gateway and EnvoyFilter compilation flow)

## What This Teaches
Because of that final realization, we agreed on shifting to an Istio Service Mesh instead of relying purely on a Gateway.

Here are the action items and lessons we are taking away to solve these issues in the long term:

- Switch to service mesh instead of gateway, Moving away from a monolithic gateway removes the single point of failure and stops all our filters from compiling into one massive file.
- Don't walk alone, Search and ask what others are doing better.
- Talking about the problem was in my case the first step to solve it. Asking for help is the most valuable thing I learned here, so a huge thanks to my team.