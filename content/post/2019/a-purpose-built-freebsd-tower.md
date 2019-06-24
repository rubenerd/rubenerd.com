---
title: "A purpose-built FreeBSD home bhyve box"
date: "2019-06-10T09:59:28+10:00"
abstract: "Deciding broadly on the hardware and a case that isn’t terrible!"
thumb: "https://rubenerd.com/files/2019/chenbro-sr107@1x.jpg"
year: "2019"
category: Hardware
tag:
- bhyve
- bhyvecon
- bsd
- cases
- freebsd
location: Sydney
---
Last week I commented that I was relieved the [Mac Pro tower existed], but that I'd replaced most of my earlier Mac Pro's tasks with FreeBSD boxes. It spawned a couple of interesting threads on Twitter.

My current home lab setup is an HP Gen8 Microserver bhyve box, and a desktop I built for games before remembering I barely play games and subsequently dual-booted as a [FreeBSD desktop](https://www.freebsd.org/doc/en_US.ISO8859-1/books/handbook/x11-wm.html#x11-wm-xfce "Xfce in the FreeBSD Handbook"). I realised neither were originally built for FreeBSD, so what would a purpose-built tower replacement look like?

This was my high-level wishlist jotted down over coffee this morning:

* A workstation motherboard for ECC. As Allan Jude says, ZFS without ECC is still more trustworthy than others *with* ECC, but every bit [flip] helps.

* An Intel Xeon CPU with a decent core count. [bhyvecon] has shown a huge amount of BSD hypervisor progress, but Intel still has the best support; how performant they'll be after the latest security fixes we'll see. Dual-socket would let me have fewer, faster cores per socket while still having passable cooling, but that would raise the price.

* A decent GPU situation for workstation use. I'm thinking the integrated Intel graphics for normal use, and eventually bhyve VGA/PCI-passthrough for a dedicated GPU to a game Windows VM for Train Simulator and X-Plane.

And then we get to enclosures. Most PC ones are ghastly, to put it charitably, and follow the Ford Model T school of colour choice. But there are a few that are inconspicuous enough and super practical: Supermicro and Chenbro make some pedestals with dual 4-drive backplanes and mounting for E-ATX, and are well laid out internally with shelving and discrete cooling zones. Here's Chenbro's SR107:

<p><img src="https://rubenerd.com/files/2019/chenbro-sr107@1x.jpg" srcset="https://rubenerd.com/files/2019/chenbro-sr107@1x.jpg 1x, https://rubenerd.com/files/2019/chenbro-sr107@2x.jpg 2x" alt="" style="width:479px" /></p>

As I said on my Mac Pro post, I also want to eat. Clara and I also have more travel on the horizon, so for now my existing setup will need to last a little longer. But I'll post my progress with this project.

[Mac Pro tower existed]: https://rubenerd.com/relief-for-the-2019-mac-pro/ "Relief for the 2019 Mac Pro"
[bhyvecon]: http://bhyvecon.org/ "Official website of bhyvecon"

