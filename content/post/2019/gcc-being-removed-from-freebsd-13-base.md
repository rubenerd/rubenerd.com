---
title: "GCC being removed from FreeBSD 13 base"
date: "2019-08-27T09:45:20+10:00"
abstract: "I’m glad to see this finally happening."
year: "2019"
category: Software
tag:
- bsd
- freebsd
- gnu
- gpl
- licencing
- llvm
location: Sydney
---
Warner Losh posted on the [FreeBSD architectures mailing list](https://lists.freebsd.org/pipermail/freebsd-arch/2019-August/019674.html) back on the 13th, a date I'm sure was entirely coincidental:

> As promised for almost the past decade or so, gcc 4.2.1 will be
> removed from the tree before FreeBSD 13 is branched. [...]
> 
> The timeline gives powerpc, mips, mips64, and sparc64 9 months to
> integrate either into an in-tree compiler, or to have a proven
> external toolchain solution. This is on top of the many-years-long
> warnings about this being the end game of the clang integration.

I'm glad to see this finally happening.

The GNU Compiler Collection was licenced under the GPLv2 up to 4.2.1 in 2007. The FreeBSD maintainers had reasonable concerns with the GPLv3, which precluded them from using anything newer. From FreeBSD 10, base is built with clang/LLVM, which distributed under a freer/BSD-friendly licence.

