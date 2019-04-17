---
title: "PF in FreeBSD and NetBSD"
date: "2019-04-10T23:14:19+10:00"
abstract: "These systems could feasibly be disabling PF in favour of IPFW and NPF."
year: "2019"
category: Software
tag:
- bsd
- firewalls
- freebsd
- netbsd
- security
location: Sydney
---
I tweeted last month that the NetBSD team are considering removing PF in favour of [NPF] for firewalling. [Maxime Villard posted] on Friday the 29th of March:

> There have been internal discussions about removing PF from NetBSD. Currently,
NetBSD's PF is 11 years old, has received no maintenance, and has accumulated
bugs and vulnerabilities that were fixed upstream but not in NetBSD.

Those justifications seem reasonable. I did like that I could carry my PF rules across from other BSDs, which lowered the barrier to entry for the few NetBSD VMs I run. But I should learn NPF.

> Importing recent versions of PF in scalable/performant kernels is a huge work
because of PF's legacy design, and there have been reports that FreeBSD is
also considering dropping PF.

This is news to me, though perhaps it shouldn't be. I used to use [PF everywhere on FreeBSD] until [AsiaBSDCon 2018] when I overheard a conversation from some FreeBSD veterans discussing how much more traffic could be pushed through IPFW. I prefer PF's syntax, and haven't ever hit any bottlenecks using it, but perhaps I should revisit IPFW.

The biggest barrier to entry for me is jails. Most documentation online discusses how to configure networking into jails using PF, and I've done it this way for so long it's basically rote. IPFW by comparison almost needs something like Firehol, though its syntax is still far better than nasty Linux IPtables.

[NPF]: https://www.netbsd.org/~rmind/pub/npf_presentation_netbsd_6.pdf "Introducing NPF in NetBSD 6"
[Maxime Villard posted]: https://mail-index.netbsd.org/tech-kern/2019/03/29/msg024883.html "Mailing list notice"
[AsiaBSDCon 2018]: https://2018.asiabsdcon.org
[PF everywhere on FreeBSD]: https://www.freebsd.org/doc/en_US.ISO8859-1/books/handbook/firewalls-pf.html "Chapter 30 of the FreeBSD Handbook on firewalls"
