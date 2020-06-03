---
title: "Locking down SSH to specific IPs"
date: "2020-05-04T19:11:59+11:00"
abstract: "It’s not foolproof, but it cuts down on drive-by auth spam."
year: "2020"
category: Software
tag:
- bsd
- freebsd
- linux
- security
- ssh
location: Sydney
---
There are some creative and fun ways people secure SSH, or any other service running on an open port. At a previous company they sent a specially-crafted UDP packet containing a nonce to *knock* on a server, which would temporarily add their IP address to the firewall and permit them access.

My favourite way, in part because it's so easy, is to lock down access to specific hard-coded IPs or ranges. I have static IPs at home and work, so this is easy. Otherwise you could enable it just for your ISP's range, [such as with ipfw](https://rubenerd.com/chaining-addresses-in-freebsd-ipfw/).

The primary risk of this approach is you can lock yourself out if one or more of your IP addresses change. If you use a good cloud provider like an [OrionVM reseller](https://www.orionvm.com/) (nudge cough) you can use the out-of-band console to connect and add another IP. For other clouds, you'd need to implement something more like above.

Locking a firewall port to specific ranges or addresses for SSH isn't foolproof, but it's one more layer of security which is always welcome. Above all else, it drastically cuts down on drive-by auth spam.

