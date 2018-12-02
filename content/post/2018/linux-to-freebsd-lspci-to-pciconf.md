---
title: "Linux to FreeBSD: lspci to pciconf"
date: "2018-11-07T08:24:23+11:00"
abstract: "The first in a series helping people make the switch"
year: "2018"
location: Sydney
category: Software
tag:
- bsd
- freebsd
- linux
- linux-to-freebsd
---
I'm seeing a lot of renewed interest in FreeBSD from GNU/Linux people. This is encouraging! You should be familiar with much of the userland, but there are a few differences, which I hope this new [post series] will help with.

`lspsi` is a common tool for listing PCI devices, as the name may suggest. For example, in a Xen domU:

    00:02.0 Unassigned class [ff80]: XenSource, Inc. Xen Platform Device (rev 01)
    00:03.0 VGA compatible controller: Cirrus Logic GD 5446 (prog-if 00 [VGA controller])

The broad equivilent is `pciconf -lv`:

    xenpci0@pci0:0:2:0:	class=0xff8000 card=0x00015853 chip=0x00015853 rev=0x01 hdr=0x00
        vendor     = 'XenSource, Inc.'
        device     = 'Xen Platform Device'
    vgapci0@pci0:0:3:0:	class=0x030000 card=0x11001af4 chip=0x00b81013 rev=0x00 hdr=0x00
        vendor     = 'Cirrus Logic'
        device     = 'GD 5446'
        class      = display
        subclass   = VGA

Note the subtle differences with the PCI addresses, which you'll need to tweak your scripts for if you parse them.

[post series]: https://rubenerd.com/tag/linux-to-freebsd/

