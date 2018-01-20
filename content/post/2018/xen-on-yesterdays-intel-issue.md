---
title: "Xen on yesterday’s Intel issue"
date: "2018-01-04T10:16:02+11:00"
abstract: "This is the clearest explanation I've read about the mechanism of the exploit."
year: "2018"
category: Hardware
tag:
- security
- intel
- xen
---
The Xen security team released [XSA-254], with some more details about [yesterday's Intel revelations]. This is the clearest explanation I've read about the mechanism of the exploit:

> Processors give the illusion of a sequence of instructions executed
> one-by-one.  However, in order to most efficiently use cpu resources,
> modern superscalar processors actually begin executing many
> instructions in parallel.  In cases where instructions depend on the
> result of previous instructions or checks which have not yet
> completed, execution happens based on guesses about what the outcome
> will be.
>
> If the guess is correct, execution has been sped up.  If the
> guess is incorrect, partially-executed instructions are cancelled and
> architectural state changes (to registers, memory, and so on)
> reverted; but the whole process is no slower than if no guess had been
> made at all.  This is sometimes called "speculative execution".
>
> Unfortunately, although architectural state is rolled back, there are
> other side effects, such as changes to TLB or cache state, which are
> not rolled back.  These side effects can subsequently be detected by
> an attacker to determine information about what happened during the
> speculative execution phase.  If an attacker can cause speculative
> execution to access sensitive memory areas, they may be able to infer
> what that sensitive memory contained.

I had to check Wikipedia what [TLB] was:

> A translation lookaside buffer (TLB) is a memory cache that is used to reduce the time taken to access a user memory location. It is a part of the chip’s memory-management unit (MMU). The TLB stores the recent translations of virtual memory to physical memory and can be called an address-translation cache.

[yesterday's Intel revelations]: https://rubenerd.com/intels-protected-kernel-memory-leak-fun/
[TLB]: https://en.wikipedia.org/wiki/Translation_lookaside_buffer "Wikipedia: Translation lookaside buffer"
[XSA-254]: https://lists.xen.org/archives/html/xen-devel/2018-01/msg00103.html

