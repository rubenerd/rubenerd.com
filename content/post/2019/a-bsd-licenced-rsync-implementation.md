---
title: "Openrsync: A BSD-licenced rsync"
date: "2019-02-11T15:57:56+11:00"
abstract: "Using OpenBSD's native pledge and unveil systems."
year: "2019"
category: Software
tag:
- bsd
- netbsd
- openbsd
- rsync
location: sydney
---
Kristaps Dzonsons has developed a clean-room implementation of rsync, based on [The rsync Algorithm] by Andrew Tridgell and Paul Mackerras. It's licensed under BSD/ISC, and leverages OpenBSD's native `pledge` and `unveil` security systems.

I predominantly use FreeBSD, so I was encouraged by the portability section of the README:

> This is possible (I think?) with FreeBSD's Capsicum, but Linux's security facilities are a mess, and will take an expert hand to properly secure.

I'm looking forward to someone smarter than me figuring out how this would work on FreeBSD; one fewer GPL package is always a good thing. rsync isn't just a nice thing to have, it makes my work and personal projects possible.

This is the [cvs tree], and here's its [page on GitHub].

[cvs tree]: https://cvsweb.openbsd.org/cgi-bin/cvsweb/src/usr.bin/rsync/
[page on GitHub]: https://github.com/kristapsdz/openrsync
[The rsync algorithm]: https://rsync.samba.org/tech_report/

