---
title: "A brief history of KornShell time"
date: "2019-07-24T15:56:32+10:00"
abstract: "Earlier this year I didn’t know the difference between ksh93, pdksh, mksh, and oksh. Perhaps this post will be useful for someone else now."
year: "2019"
thumb: "https://rubenerd.com/files/uploads/netbsd-smaller-crop.png"
category: Software
tag:
- bsd
- freebsd
- kornshell
- ksh
- netbsd
- openbsd
location: Sydney
---
Earlier this year I discussed trying the KornShell as my daily driver, but I didn't know the difference between the major versions. Perhaps this brief summary post might be useful to someone.

* [`ksh93`](http://kornshell.org/) is the evolution of the canonical ksh88 by David Korn and Morris Bolsky at AT&T. It was originally proprietary, but has since been released into the public domain. It's actively maintained, and shipped with macOS. It's officially spelled *KornShell*.

* [`pdksh`](https://www.netbsd.org/docs/misc/index.html#shells) is the Public Domain Korn Shell, released in response to ksh88 being proprietary. NetBSD's default install includes this variant, and it was the first Korn Shell I used. This, and all its other derivatives, are spelled *Korn Shell* with a space.

* [`mksh`](https://www.mirbsd.org/mksh.htm) is the MirBSD/MirOS Korn Shell. Based on `pdksh`. The landing page is outdated, but it's still actively maintained.

* [`tcksh`](#) is the TENEX Sea Kucumber Shell. Blatantly made up by me.<p></p>

* [`oksh`](https://github.com/ibara/oksh) is the Portable OpenBSD Korn Shell. Based on `pdksh`, with enhancements. I use this variant now, for a few delightful reasons I will soon blog about.

