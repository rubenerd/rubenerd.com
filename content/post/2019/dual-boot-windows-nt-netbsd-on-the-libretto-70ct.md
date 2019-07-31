---
title: "Dual-boot NT and NetBSD on the Libretto 70CT"
date: "2019-07-27T09:57:30+10:00"
abstract: ""
thumb: ""
year: "2019"
category: Thoughts
tag:
- 
location: Sydney
---
The tiny Libretto 70CT is one of my all-time favourite computers. I bought one on eBay a decade ago to fulfill a childhood dream, and it's been so much fun to use. It packs a Pentium 1 CPU, 32 MiB of memory, and a 640x480 VGA display into a tiny case that even by today's standards is impressive. I've blogged about it a few times.

Last weekend's project was getting it dual-booting with Windows NT 4.0 for nostalgia and because it has drivers, and NetBSD 8.1 because I can. For those asking why, why do people do anything?

You've got a few options for dual booting. This [NetBSD mailing list thread](https://mail-index.netbsd.org/port-i386/2008/04/25/msg000453.html) suggested [WinImage BootPart](http://www.winimage.com/bootpart.htm) which can add NetBSD to Windows NT's boot loader, but I decided just to use NetBSD's.

Getting it dual booting was easier than I expected.

### Preparing the boot volume

1. Attach your boot device to an external machine with a hypervisor. Use a 16 GiB CompactFlash card with a 2.5-inch IDE adaptor if you can, it'll be faster and use less power than spinning rust.

2. Pass the boot device into the hypervisor. I use bhyve, but any Unix-like machine can use QEMU to do this easily too.


### Installing Windows NT

1. Boot Windows NT 4.0 from ISO, if you can avoid creating those boot floppies. If the installer detects your VM as an *MPS Multiprocessor PC* as it does under bhyve, change it to *Standard PC* or it won't boot.

2. Partition your drive with sufficient leftover space for NetBSD. I tend to create a 2 GiB NTFS partition, and a 128 MiB FAT32 for sharing data with NetBSD.

3. After that point, it's a standard install. Let it finish, and restart a couple of times. Copy the drivers from the <del>Toshiba</del> [Dynabook website](https://support.dynabook.com/support/modelHome?freeText=1073769619&osId=3333623), but don't install until it's in the Libretto.


### Installing NetBSD

1. Boot the NetBSD 8.1 installer from ISO. At the MBR step, choose *Edit the MBR partition table* insead of *Use the entire disk*.

2. At the MBR table editor step, edit the first partition and set its `bootmenu` to something like `NT4`. Then add your NetBSD install to partiton B. Set `Active` to `Yes`, `Install` to `Yes`, and `bootmenu` to something like `NetBSD`.

5. The rest of the install is standard. I echewed (gesunteit) X11 for now, because I want to see how much I can get away with using curses-style applications! But I'll definitely be trying IceVM and Fluxbox on it at some point.

6. Reboot, and you should get NetBSD's minimal boot loader.


### Finishing up

Pop the drive out, put in the Libretto, and you should have your obscurely fabulous Libretto booting what you want.

    Booting from Hard Disk...
    Fn: diskn
    1: NT4
    2: NetBSD

 

