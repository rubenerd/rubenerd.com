---
title: "ZFS isn’t just for NAS boxes"
date: "2019-07-05T08:19:45+10:00"
abstract: "I keep reading this! FreeBSD uses ZFS for jails, bhyve, the Poudriere pkgng build system, atomic upgrades, and it’s precicely suited to consumer laptops and desktops."
year: "2019"
category: Software
tag:
- bsd
- file-systems
- freebsd
- zfs
location: Sydney
---
I'm still surprised by the number of online tutorials and social media posts that dismiss ZFS as being only useful for file servers, or only bring it up in that context. I wholeheartedly recommend it for this purpose, but at least on FreeBSD it hasn't been limited to that for years:

* The official Poudriere system for building ports for pkgng uses ZFS to create isolated pools that are blown away once a port is built. This way the environment is clean to start, and you don't junk up your production system. Packages you install on FreeBSD now have been built this way.

* It's invaluable for laptops or consumer-grade desktops with flaky hardware precisely because it always remains consistent, even if a suspend or hibernation fails, or a battery dies. You can't say the same for other file systems, even with journaling or softupdates enabled. Don't have the memory or CPU for deduping or aggressive compression? Don't turn on those features!

* Simple snapshotting lets you make substantive changes to any portion of your system, and roll it back. Allan Jude demonstrated at AsiaBSDCon 2019 the idea of using ZFS for in-place, atomic upgrades of the base system. I use it to try on new desktop environments and software.

* iocage uses ZFS by default for creating jails, and it's increasingly the preferred approach for ezjail and manual builds. Other approaches for using jails are, at the very least, tedious.

* In the same vein as jails, ZFS with bhyve is 👌. I think that may have been the first time on this blog I used an emoji inline in text.

* Send/receive, inline compression, and encryption in the latest OpenZFS versions don't quite get to HAST-levels of high availability for true geo redundancy, but it's ideal for remote backups and restores. And hey, you can use it with HAST and GELI too!

