---
title: "What’s new in the Debian installer"
date: "2017-09-21T09:10:41+10:00"
abstract: "No more PowerPC, defaulting to 32bit, and HTTPS apt in the installer"
category: Infocomm
tag:
- software
- linux
- debian
- retro
- nostalgia
- powerpc
- apple
- ibook
---
I missed a few of these nuggets when Debian 9 Stretch came out:

> Support for the powerpc architecture has been removed.

This makes me sad :(. My first Mac was an iMac DV, but my iBook G3 is still probably my favourite computer I've ever had. It's had Mac OS 9, Mac OS X, Yellow Dog, Gentoo, the BSDs, but I guess [no longer Debian] – and Ubuntu by extension. I don't blame them, but feels like the end of an era.

> The installer and the installed systems use a new standard naming scheme for network interfaces. ens0 or enp1s1 (ethernet) or wlp3s0 (wlan) will replace the legacy eth0, eth1, etc.

I also don't blame them, but good news its easy to rename back.

> Since 64-bit PCs have become more common, the default architecture on multi-arch images is now amd64 instead of i386.

Solid idea, though glad i386 still exists for my Pentium MMX tower :).

> Also, as the installer now gives an easy choice of desktop selection within tasksel, only Xfce CD#1 remains as a single-CD desktop system.

Good, Xfce is the still best *nix desktop environment.

> Support for HTTPS has been added to the installer, enabling downloading of packages from HTTPS mirrors.

That's cool, I don't need to install [apt-transport-https] in my Ansible playbooks for repos like the tirelessly-maintained [Sury]. Actually now that I re-read, it says added to the **installer**, still not sure if it's installed by default now.

[no longer Debian]: https://www.debian.org/releases/jessie/powerpc/ch05s01.html.en "Debian Jessie PowerPC release notes"
[apt-transport-https]: https://packages.debian.org/sid/apt-transport-https
[Sury]: http://deb.sury.org
