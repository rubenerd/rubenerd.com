---
title: "DirtyCOW"
date: "2016-10-24T15:14:00+10:00"
category: Software
tag: 
- linux
- security
---
I go on leave for three weeks, and [this happens].

> A race condition was found in the way the Linux kernel's memory subsystem handled the copy-on-write (COW) breakage of private read-only memory mappings.

Fake, inflated self importance aside, the joke I was attempting to make regarded the timescale. Linus' (Linus's?) initially observed the issue back in 2007, according to the kernel commit logs. And it's impacted most distributions since, specifially:

> An unprivileged local user could use this flaw to gain write access to otherwise read-only memory mappings and thus increase their privileges on the system.
> 
> This flaw allows an attacker with a local system account to modify on-disk binaries, bypassing the standard permission mechanisms that would prevent modification without an appropriate permission set.

The key is it's a local privilege escalation attack; one would need access to the target first. Once a nefarious user is in though, they may as well be running as root for all practical purposes.

I could gloat as a FreeBSD guy, but we had our own [nasty issue recently] too. One could include any manner of extra files in a package, and it would still pass verification and install.

The lesson here is (to poorly paraphrase an old lecturer and friend): software is like Swiss cheese. Holes are inevitable; it's when they line up when issues arise.

[this happens]: https://github.com/dirtycow/dirtycow.github.io/wiki/VulnerabilityDetails
[nasty issue recently]: https://www.freebsd.org/security/advisories/FreeBSD-SA-16:30.portsnap.asc
