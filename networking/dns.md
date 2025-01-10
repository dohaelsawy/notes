## DNS 

### Resources
- [What is DNS? | How DNS works - cloudflare](https://www.cloudflare.com/learning/dns/what-is-dns/)


### What is DNS?
- Domain Name System (DNS) is the phonebook of the Internet. DNS translates domain names to IP addresses so browsers can load Internet resources.

- Each device connected to the Internet has a unique IP address which other machines use to find the device.


### 4 DNS servers involved in loading a webpage:
- **DNS recursor**: The DNS recursor is a server designed to receive queries from client machines through applications such as web browsers. 
- **Root nameserver**: The root server is the first step in translating (resolving) human readable host names into IP addresses. it serves as a reference to other more specific locations.
- **TLD nameserver**: The top level domain server (TLD) can be thought of as a specific rack of books in a library. This nameserver is the next step in the search for a specific IP address, and it hosts the last portion of a hostname (In example.com, the TLD server is “com”).
- **Authoritative nameserver**: The authoritative nameserver is the last stop in the nameserver query. If the authoritative name server has access to the requested record, it will return the IP address for the requested hostname back to the DNS Recursor that made the initial request.


### What's the difference between an authoritative DNS server and a recursive DNS resolver?

- each has a different locations of a DNS query, recursive is the first stage and authoritative is the last stage.

#### Recursive DNS resolver
- it is the one who respond to client and takes the time to track down the DNS record, it makes series of request until reaches the authoritative resolver, use cache to help things go faster

#### Authoritative DNS server
- the server that is responsible for respond with queried DNS resource records, allowing the browser to make a request to reach the IP address needed to access web resources 


### What is after returning a IP address to the browser?
- the browser then establish a connection between the server of the domain address and DNS journey comes to an end 


### Types of DNS queries:
- **Recursive query**: a DNS client requires that a DNS server (typically a DNS recursive resolver) will respond to the client with either the requested resource record or an error message
- **Iterative query**: in this situation the DNS client will allow a DNS server to return the best answer it can. If the queried DNS server does not have a match for the query name, it will return a referral to a DNS server authoritative for a lower level of the domain namespace. The DNS client will then make a query to the referral address. This process continues with additional DNS servers down the query chain until either an error or timeout occurs.

- **Non-recursive query**: when a DNS resolver client queries a DNS server for a record that it has access to either because it's authoritative for the record or the record exists inside of its cache.


### DNS Cache:
- DNS caching involves storing data closer to the requesting client so that the DNS query can be resolved earlier and additional queries further down the DNS lookup chain can be avoided, thereby improving load times and reducing bandwidth/CPU consumption.