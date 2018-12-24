---
title: "ifconfig"
date: "2018-10-25T16:55:38+11:00"
abstract: "I miss FreeBSD."
year: "2018"
category: Software
tag:
- bsd
- freebsd
- linux
- written-in-sydney
---
The first thing I do on apt systems is install net-tools to get `ifconfig` back. The reason being that some Linux distros have removed it entirely in lieu of `ip`. There are a few stated reasons why:

1. ip has been the default and recommended toolchain since at least version 2.4 of the Linux kernel.

2. ifconfig was written for BSD, and was an awkward fit on Linux.

3. ifconfig is horribly broken and/or inefficient.

4. *[Yeah, don't do that]*, or *[consider to be ridiculed at]*; the latter reason I'm still trying to parse.

5. `ip` is easier to search for than `ifconfig`. Okay that's a joke, but they would have written that stack in the age of search engines.

These may be true, though I wonder why they couldn't maintain the interface and either rewrite or extend it?

The first link above tellingly says ip can "can step in for netstat, route, and arp too." Based on past behavior, we could be forgiven for thinking this is Linux breaking cross-platform \*nix behavior again for a kudzu ending in D, which is a shame.

Whatever the case, it still doesn't take long on a Linux box to make me miss FreeBSD.

[Yeah, don't do that]: https://community.spiceworks.com/how_to/107678-ip-your-ifconfig-alternative
[consider to be ridiculed at]: http://inai.de/2008/02/19

