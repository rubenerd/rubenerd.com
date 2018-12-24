---
title: "Burning ISOs in El Capitan"
date: "2015-12-19T09:19:00+10:00"
abstract: "Use the Finder or hdiutils"
year: "2015"
category: Software
tag:
- apple
- bsd
- freebsd
- isos
- el-capitan
- guides
- hdiutils
- macos
- mac-os-x
- os-x
---
Behind Disk Utility's fresh new veneer in El Cappuccino lies a sinister change:

> The document "FreeBSD-10.2-RELEASE-amd64.iso" could not be opened. Disk Utility cannot open files in the "ISO Disk Image" format.

Can you run that by me again? I think I just blew a fuse in my head.

Fortunately, you can still burn ISOs from the Finder. Because being able to burn disks from something called the Finder makes more sense than something called Disk Utility:

1. Select the target ISO
2. Go to the Finder File menu
3. Choose "Burn Disk Image <disk.iso> to Disc..."

The feature also still exists in hdutil:

    $ hdiutil burn <disk.iso>

I appreciate Macs don't ship with optical drives anymore, but hardware they still officially support with the OS do. I try to read into decisions like this more than the knee-jerk pundits, but graphical removal of this feature is bizarre.

The hdiutil -pubkey feature that was introduced in 10.4 Tiger (or possibly even earlier) is also still broken, though I wasn't expecting any less. Come on Apple, what you're doing with Core Storage is really cool, why not go all the way?

