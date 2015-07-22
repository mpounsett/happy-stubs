
A stub resolver may have multiple iterative server addresses to choose from,
but this information alone is insufficient to make a choice which will result
in good performance for the application which initiated a query.  The first
host selected may be unreachable for any number of reasons, including being
offline, or being on the opposite side of a black hole affecting its address
family.  The stub resolver cannot know before issuing a query to such a server
that the query will time out.

Simply providing a stub resolver with a list of iterative servers to be
queried in sequence is insufficient for the stub resolver to reliably provide
timely service to the applications relying on it.  A stub resolver must
implement other strategies to improve performance when one or more of its
listed iterative resolvers is unavailable or slow to respond.

## Multiple Existing Algorithms

It is not feasible to enumerate the algorithms of all current stub resolvers
in this document, nor would it be desirable to do so.  Factoring the changing
behaviours of stub resolvers included with each version of an OS, with the
wide variety of operating systems, with the number of applications which
implement their own resolver logic, and their changing behaviour from version
to version, it is reasonable to conclude that there are at a minimum many
dozens of different possible algorithms which would have to be listed.  Where
describing current behaviour is necessary, this document will focus on common
behaviours which should be changed in the algorithms of future stub
resolvers.

## Sequential Queries

It is common for a stub resolver to step through its list of upstream
iterative resolvers one at a time, in the order listed.  Current best practice
is to list IPv6 addresses ahead of IPv4 addresses^(citation\ needed)^, however
an issue with the IPv6 connectivity of the host, or a black hole in the IPv6
network between the host and the iterative resolver, will result in timeouts
for the stub resolver; listing IPv4 addresses first has identical issues.
This problem is address family agnostic, and applies whatever current or
future address family is preferred.  In an extreme case (e.g 4 listed
iterative resolvers where only the last in the list is reachable) the delay
between the first query being issued and an answer being received may be
enormous.

## Isolation and Amnesiac Operation

Many OS stub resolvers are libraries linked to by an application which do not
have any shared resources across applications.  In this case it is impossible
for the stub resolver to learn, based on the queries of one application, that
an iterative resolver is unavailable and apply that knowledge to the queries
of another application.

Many stub resolvers do not even maintain state information for listed
iterative resolvers within the same process, resulting in subsequent queries
from the same application being subject to the same series of potential
timeouts.

In these cases, even external modification of the stub resolvers list of
upstream servers is insufficient, since most applications do not re-read the
list of name servers after startup.  


