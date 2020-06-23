---
title: "ARM Macs (but RISC-V would be cooler)"
date: "2020-06-17T15:49:03+10:00"
abstract: "The future is ARM, but it will make my life more complicated in the short term."
year: "2020"
category: Hardware
tag:
- apple
- arm
- macos
- mac-os-x
- powerpc
location: Sydney
---
The rumours of an ARM-based Mac have only been getting louder with WWDC approaching. Old rumours have been reheated and served as fresh news, and pundits have worked themselves into a lather unlike anything I've seen in a while. It's not the first architecture transition for many of us in the ecosystem, but while there are superficial similarities between Motorola to PowerPC, and PowerPC to Intel, there's enough unique about this situation to be interesting.

I forgot that my earliest blog posts here were written on my beloved old iBook G3. It was the first machine I ran Mac OS X, FreeBSD, and NetBSD on, the latter two in part because their PowerPC support was so great. Two years later in 2006, I was writing about [downloading universal binaries from Mozilla](https://rubenerd.com/universal-binaries-for-mozilla-software/) for my shiny new first-generation Intel MacBook Pro. That screenshot of Camino takes me back.

The PowerPC to Intel transition, and Apple's handling of it, offered four compelling changes:

1. **Better performance.** Intel's CPUs were faster by that stage, but more importantly they offered better performance-per-watt. I also had a PowerPC G5 tower, but by that stage it had become obvious an equivalent PowerBook wasn't feasible. Intel's CPU roadmap also looked more assured.

2. **Instant access to PC software and games.** We weren't stuck with slow Virtual PC anymore, we could hack our machines to dual-boot into Windows when we needed to. I was so excited to beta test the first versions of [Parallels Desktop](https://rubenerd.com/parallels-desktop-freebsd-issues/) and [VMware Fusion](https://rubenerd.com/just-bought-vmware-fusion/). And eventually, Apple officially offered [Boot Camp in 2006](https://rubenerd.com/apple-boot-camp-windows-xp-on-mac/).

3. **Easier software porting**. Games especially benefited from this.

4. **Decent (enough) compatibility**. [Universal binaries](https://rubenerd.com/thinning-universal-binaries-with-ditto/) meant you didn't have to worry about new software being compatible. Rosetta could also dynamically translate PowerPC to Intel fairly well, given how much faster the Intel silicon was. Four years later, and [PowerPC started to disappear](https://rubenerd.com/universal-binaries-disappearing/).

There's every reason to believe an ARM-based Mac would offer all of the same benefits that Intel offered in point 1) above. Apple's phones have the fastest CPUs in the industry, and the performance-per-watt could offer iPad-like battery life and performance in a Mac, for those of us who don't like tablets.

The other points, perhaps selfishly, worry me.

Is there sufficient performance headroom on ARM to offer an amd64 translation layer that wouldn't be so slow as to be practically useless? Would Apple even offer one? Will it only accelerate macOS's devolution into a platform to run horrible Electron apps, or poorly-ported software from iOS?

A big part of the Mac value proposition for me was the fact I could use the desktop with which I was most familiar and enjoyed using, but could drop to PC land for a specific Windows tool or game. Yes I could use another dedicated PC that would sit there taking up space 90% of the time, but that's another machine I have to maintain and keep in a tiny apartment. You also lose portability and convenience, something that nay gets a mention when someone brings it up.

Despite the architecture being more splintered than amd64, it's easy to see the future is ARM. The Pinebook Pro is the most compelling hardware I've seen in a while. I like playing world-building and simulation games sometimes. And yes, I still prefer macOS to Windows or other \*nix desktops. Reconciling these increasingly-conflicting needs in one machine to do it all perhaps says more about me than a CPU transition.

My daily carry is already a Panasonic Let's Note running FreeBSD, and I already offload as much as I can to my FreeBSD and NetBSD Microservers, and FreeBSD and Linux in cloud instances. I suspect the game machine I was going to get rid of might end up sticking around; I'll just have to clean the dust off and wait for Windows Update each month I turn it on.

Part of me wishes that if they were going to ditch amd64, they'd go full hog and announce iOS and macOS on RISC-V. They've done more unpredictable stuff before!

