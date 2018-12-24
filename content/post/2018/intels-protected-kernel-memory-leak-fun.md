---
title: "Intel’s protected kernel memory leak fun"
date: "2018-01-03T13:28:23+11:00"
abstract: "Can’t be patched in microcode, and fix has a performance impact. Uh oh."
year: "2018"
category: Hardware
tag:
- intel
- cpus
- written-in-sydney
---
John Leyden and Chris Williams have done [excellent work] reporting this news for The Register. Read it in full for all the details; I could barely believe it.

In short, 64-bit Intel CPUs leak protected kernel memory, and a microcode fix won't be possible. Operating systems will have to be updated to mitigate it, which will incur a performance penalty. 

[AMD's Tom Lendacky] inadvertently provides the best summary:

> AMD processors are not subject to the types of attacks that the kernel
> page table isolation feature protects against. The AMD microarchitecture
> does not allow memory references, including speculative references, that
> access higher privileged data when running in a lesser privileged mode
> when that access would result in a page fault.

And [Postgres's Andres Freund] gives an indication of the performance impact and worst case scenario. `pti` is page table isolation, the immediate software workaround:

    pgbench SELECT 1, 16 clients, i7-6820HQ CPU (skylake):  
    pti=off: tps = 420490.162391  
    pti=on: tps = 350746.065039 (~0.83x)  
    pti=on, nopcid: tps = 324269.903152 (~0.77x)

This is hot on the heels of the latest [Intel Management Engine problems].

There have been plenty of other issues since, but it does harken back to that [Pentium F00F] bug:

> Due to the proliferation of Intel microprocessors, the existence of this open privilege instruction was considered a serious issue at the time. Operating system vendors responded by implementing workarounds that detected the condition and prevented the crash. Information about the bug first appeared on the Internet on or around 8 November 1997.

I still see mitigation lines against this in FreeBSD dmesg on my vintage MMX tower.

[excellent work]: http://www.theregister.co.uk/2018/01/02/intel_cpu_design_flaw/
[AMD's Tom Lendacky]: https://lkml.org/lkml/2017/12/27/2
[Postgres's Andres Freund]: https://www.postgresql.org/message-id/20180102222354.qikjmf7dvnjgbkxe@alap3.anarazel.de
[Intel Management Engine problems]: https://en.wikipedia.org/wiki/Intel_Management_Engine#Security_vulnerabilities
[Pentium F00F]: https://en.wikipedia.org/wiki/Pentium_F00F_bug

