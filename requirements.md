
A "Happy Stubs" algorithm has two primary goals:

1. Provide fast DNS resolution for end hosts, provided that at least one of
its configured iterative servers is reachable.
1. Avoid thrashing the network, by not always making simultaneous connection
attempts to multiple iterative servers.

A stub wishing to meet these goals SHOULD use the following set of strategies:

* Maintain historical state of the reachability and RTT of the configured
  iterative servers
* Use historical state to send the majority of queries to iterative servers
  that are known to be performing well.
* On occasion, issue multiple simultaneous queries to multiple iterative
  servers, passing the first-received response to the client application.
* When iterative servers on multiple address families are performing
  similarly, prefer connecting to IPv6 servers.


## Delayed Responses

> how to behave when a server is answering but performing poorly

## Unresponsive Servers

> how to behave when a server is completely unresponsive

## Stateful Behaviour

> how to cache the state of individual servers, and how use and refresh that
> cache information

## Shared Resources

> making the cache available to multiple client applications
