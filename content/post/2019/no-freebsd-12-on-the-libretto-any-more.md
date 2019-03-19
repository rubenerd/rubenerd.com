---
title: "No FreeBSD on the Libretto any more"
date: "2019-03-09T22:26:36+11:00"
abstract: "Time to try NetBSD perhaps, it can run on 64 MiB of RAM."
year: "2019"
category: Hardware
tag:
- bsd
- freebsd
- libretto
- netbsd
- toshiba
- retro
location: Sydney
---
One of the most enduringly popular blog posts I've ever written was this brief entry about booting [FreeBSD 8.0 on the tiny Toshiba Libretto 70CT] almost a decade ago. I'm off to AsiaBSDCon again in a couple of weeks, so I thought it'd be a lark to get it going again as a tiny note-taking device.

Unfortunately, no dice. It kernel panics: 

    Building the boot loader arguments
    Looking up /BOOT/LOADER... Found
    Relocating the loader and the BTX
    Starting the BTX loader  
      
    BTX loader 1.00  BTX version is 1.02
    Consoles: internal video/keyboard
    BIOS CD is cd0
    BIOS drive A: is disk0
    BIOS drive C: is disk1  
      
    int=0000000d  err=00000000  efl=00000246  eip=001f6026
    eax=00000000  ebx=000923b8  ecx=00028df6  edx=00000000
    esi=00200243  edi=00092398  ebp=00000000  esp=00092384
    cs=002b  ds=0033  es=0033    fs=0033  gs=0033  ss=0033
    cs:eip=0f 01 15 37 02 20 00 8b-74 24 18 83 fe 00 74 0f
           8b 4e 30 29 cd 89 ef f3-a4 89 6c 24 18 89 fd b9
    ss:esp=00 00 00 00 3f 00 00 00-00 00 00 00 98 23 09 00
           00 00 00 00 00 00 00 00-00 00 00 00 02 02 00 00
    BTX halted

I soon found out why, from the [FreeBSD Handbook]\:

> A FreeBSD installation requires a minimum of 96 MB of RAM and 1.5 GB of free hard drive space. However, such small amounts of memory and disk space are really only suitable for custom applications like embedded appliances. General-purpose desktop systems need more resources. 2-4 GB RAM and at least 8 GB hard drive space is a good starting point.

This machine has 64 MiB of RAM, 32 MiB below what's required. I suppose I could build a custom kernel for it? I have [built a stripped-down one before] for this machine. Or maybe this is a sign that I should try NetBSD on it.

[FreeBSD 8.0 on the tiny Toshiba Libretto 70CT]: https://rubenerd.com/freebsd-booting-libretto/
[FreeBSD Handbook]: https://www.freebsd.org/doc/handbook/bsdinstall-hardware.html
[built a stripped-down one before]: https://rubenerd.com/only-enabling-16-bit-pcmcia-in-freebsd-kernel/
