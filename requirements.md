
A "Happy Stubs" algorithm has two primary goals:

1. Provide fast DNS resolution for end hosts, provided that at least one of
its configured iterative servers is reachable.
2. Avoid thrashing the network, by not always making simultaneous connection
attempts to multiple iterative servers.

## Delayed Responses

> how to behave when a server is answering but performing poorly

## Unresponsive Servers

> how to behave when a server is completely unresponsive

## Stateful Behaviour

> how to cache the state of individual servers, and how use and refresh that
> cache information

## Shared Resources

> making the cache available to multiple client applications
