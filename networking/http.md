## HTTP Request and its life cycle 

### Resources
- [The Journey of an HTTP request to the Backend | Backend Engineering Show - Hussein Nasser](https://www.youtube.com/watch?v=K2qV6VpfR7I)


### what kind of latency the request face before it reaches the final stage of backend that respond for that request?
- the os detect that this is a http web link which is search for a default browser to open that link in, create a instance from browser

- if the link is https then the port that the domain lives in is 443 -default-, if http only the port is 80
- next we need an IP, the os has to figure it out what is the IP from that DNS using several approaches DNSecurity or pure vanilla DNS on top of UDP, or any other configurations, then finally we resolve DNS and has a IP and port for our domain
- now we established a TCP connection on port 443, we need 4 pairs for TCP:
    - destination address
    - destination port 
    - source IP address
    - source port 

- result; stateful connection, through 3 handshake, also establish sequence numbers to label our segments 

- establish a session for security, tls and other authentication staff 
- after this story, the application is now ready to start sending and receiving data

- method, protocol and the path (parameters)
- header, host, cookies (option)  
- now we have that payload which is need to convert it to segments and need to send it to TCP vehicle
- the client which is you now have the segments chops to n and have several algorithms to chose from, send them all or 1 and acknowledgment and so on.
- in the second algo, there is about 80 millisecond for each segment that is send and come with acknowledgment, so after that the API gateway finally understands the segments and done all kind of checks and finally finally sends request to backend.
- based on maximum window size, backend make the response request and divide it to segments, and API gateway encrypt it, the journey back is begins 




### Further studies
- DNS Resolutions
- Root server for DNS
- Reverse Proxy