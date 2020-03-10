---
title: "Clearing up FreeBSD GCC news"
date: "2020-03-05T09:12:25+11:00"
abstract: "GCC in base was more than a decade old, and it'll remain in ports."
thumb: "https://rubenerd.com/files/uploads/icon.freebsd-logo.png"
year: "2020"
category: Software
tag:
- bsd
- freebsd
- gcc
- licencing
location: Sydney
---
There's a lot of misinformation and hand-wringing about [FreeBSD 13 officially removing](https://rubenerd.com/gcc-being-removed-from-freebsd-13-base/) the GNU Compiler Collection from the base system. Some of this has come down to poorly-worded article headlines, others are born of longstanding philosophical license differences.

The two key points you need to know:

* **GCC in FreeBSD base was more than a decade old**. It was the last version before the switch to the GPLv3, which the BSD projects consider problematic and incompatible.

* **GCC will remain in the ports system**. Developers who need GCC had already switched to this for years.

I know the Internet loves a good flare-up, but much like this blog, there isn't anything new or remarkable about it. Wait, ouch.

