---
title: "FreeBSD 12.1 available"
date: "2019-11-05T17:18:13+11:00"
abstract: "Is it sad I’m most excited for pipefail and trim?"
year: "2019"
category: Software
tag:
- bourne-shell
- bsd
- freebsd
- kde
- gnome
- xfce
location: Sydney
---
FreeBSD 12.1-RELEASE [is out now](https://www.freebsd.org/releases/12.1R/announce.html)! Read the [release notes](https://www.freebsd.org/releases/12.1R/relnotes.html) and [errata](https://www.freebsd.org/releases/12.1R/errata.html).

<p><img src="https://rubenerd.com/files/2019/screenie-freebsd121@2x.png"  alt="Screenshot showing a Terminal prompt with uname in FreeBSD 12.1" style="width:500px; height:333px;" /></p>

Vanilla Xfce on this release is *nice!*

clang/llvm, several archival tools, KDE, Gnome, OpenSSL, and plenty more userland tools and drivers have been updated. `trim(8)` and BearSSL have been added. And, perhaps weirdly, I'm most excited for the fact `sh(1)` now has `pipefail` which is *awesome* for someone who admittedly spends more time writing shell code than anything else thesedays.

Thanks to the release team, the Foundation, and everyone involved. And also a shoutout to John-Mark Gurney for making [BitTorrent magnet links](https://people.freebsd.org/~jmg/FreeBSD-12.1-R-magnet.txt) available. Let's save the project some bandwidth and share the love.

I'll be updating OrionVM's FreeBSD 12.x template this week, otherwise you can use the standard `freebsd-update` mechanism in your existing VMs to jump to 12.1. Note that your disk will still show as FreeBSD 12.0, because that was the original template.

