% Title = "Happy Eyeballs for DNS on End-user Hosts"
% abbrev = "DNS Happy Eyeballs"
% category = "std"
% docName = "draft-pounsett-happy-stubs-00"
% ipr = "trust200902"
% area = "OPS"
% workgroup = "DNS Operations Working Group"
% keyword = ["stub resolver", "resolver", "happy eyeballs"]
%
% date = 2015-07-21T00:00:00Z
% 
% [[author]]
% initials = "M."
% surname = "Pounsett"
% fullname = "Matthew Pounsett"
% role="author"
% organization = "Rightside"
% 	[author.address]
%	email = "matt@conundrum.com"
%

.# Abstract

DNS is the underpinning of nearly all protocols on the Internet.  When it is
performing poorly it results in an undesirable user experience for every
service which depends on it.  The typical algorithm used by stub resolvers and
other non-iterative resolvers can can result in long delays when the first
queried iterative resolver is unreachable or unresponsive.  This problem can
be compounded when the non-iterative resolver is given a long list of
iterative servers in order to cover both IPv4 and IPv6 services.

This document specifies requirements for resolver algorithms to reduce the
likelihood of a poor user experience due to upstream DNS performance issues,
and provides a suggested algorithm.

{mainmatter}

# Introduction

The typical algorithm of a stub resolver involves sending sequential queries,
which do not overlap in time, to a list of one or more iterative DNS
resolvers until either an answer is received, or until all listed iterative
resolvers have timed out.  If the first listed server is slow to respond, or
times out completely, it is enough to create a poor user experience for any
end-user application relying on a response.  Often the first time out is
enough to cause the querying application to time out itself, rendering
queries sent to subsequent resolvers useless.

This problem is compounded when multiple iterative resolvers are listed for
both IPv4 and IPv6.  A black hole or other service problem affecting only one
protocol may result in poor user experience that could be avoided by querying
over the other protocol.  If two or more iterative servers for the poorly
performing protocol happen to be listed first there could be quite a long
delay before the servers on the better performing protocol are queried.

A stub resolver can improve user experience by more aggressively querying
multiple iterative servers.   There are a variety of algorithms which could be
envisioned to improve user experience in this way.  This document specifies
requirements for any such algorithm, with the goals that the network and
servers not be inordinately harmed with a simple doubling of traffic, and the
client address preference be honoured ([@!RFC3484]).

As the problems are similar in nature, this document borrows heavily from
[@RFC6555], taking the recommendations of that document and applying them as
needed to the unique issues of stub resolvers.

## Additional Network and Host Traffic

Additional network traffic and additional server load is created due to the
recommendations in this document, especially when connections to the preferred
address family (usually IPv6) are not completing quickly.

The procedures described in this document retain a quality user experience
while still giving IPv6 a slight preference over IPv4 (in order to remove load
from IPv4 networks and, most importantly, to reduce the load on IPv4 network
address translators).  The user experience is improved to the slight detriment
of the network, and iterative DNS resolvers that are serving the client host.

# Notational Conventions

## RFC 2119

The key words "**MUST**", "**MUST NOT**", "**REQUIRED**", "**SHALL**",
"**SHALL NOT**", "**SHOULD**", "**SHOULD NOT**", "**RECOMMENDED**", "**MAY**",
and "**OPTIONAL**" in this document are to be interpreted as described in
[@!RFC2119].

## Resolver Types

Throughout this document, unless otherwise noted, any references to 'stub
resolvers' are intended to include any non-iterative resolver library or
application (both caching and non-caching) providing DNS service to one or
more applications on the local host.

# Problem Statement

# Algorithm Requirements

# Additional Considerations

# Example Algorithm

# Security Considerations


{backmatter}


