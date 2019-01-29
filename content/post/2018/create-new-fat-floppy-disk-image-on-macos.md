---
title: "Create new FAT floppy disk image on macOS"
date: "2018-12-03T12:00:44+11:00"
abstract: "Using diskutil or newfs_msdos"
year: "2018"
category: Thoughts
tag:
- disks
- disk-images
- fat
- mac-os-x
- macos
- os-x
- virtualisation
location: sydney
---
Create a new blank file with 1.44 MiB:

    $ dcfldd if=/dev/zero of=floppy.img bs=512 count=2880

Attach the disk image, but don't mount it:

    $ hdiutil attach -nomount floppy.img
    ==> /dev/disk2

You'll get a device identifier back. After that, it's the same as FreeBSD to create a FAT volume:

    $ newfs_msdos /dev/disk2
    ==> /dev/disk2: 2829 sectors in 2829 FAT12 clusters \
    ==> (512 bytes/cluster) bps=512 spc=1 res=1 nft=2 \
    ==> rde=512 sec=2880 mid=0xf0 spf=9 spt=32 hds=16 hid=0 drv=0x00

Or you can use hdiutil:

    $ diskutil eraseVolume MS-DOS "LABEL" /dev/disk2

And then you can use it in your VM, or however else you need.

