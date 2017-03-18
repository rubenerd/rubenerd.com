---
draft: true
title: "Rubénerd gets an upgrade"
date: "2017-03-04T10:19:00+10:00"
abstract: "Incidental news if ever there was any, but exciting."
category: Internet
tag:
- cloud
- joviam
---
Great news for my humble site here, and incidental to everyone reading this! *Rubénerd* is now running on a larger cloud instance. The Joviam cloud scales memory and CPU cores, so you can't starve your machine of one while scaling the other. To get an extra CPU core, I've now got twice as much memory.

FreeBSD remains my favourite general purpose server, but unfortunately the standard nginx-devel port doesn't include the MORE_HEADERS extension. This is all but mandatory if you want to do SSL, so you can define strict-transport-security, X-Content-Security-Policy, and other headers.

With more cores and memory, I can now build the nginx-devel port and a few others right there on the box, rather than shuffling things around. It just makes things simpler.

