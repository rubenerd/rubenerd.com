---
title: "My humble homelab, with awful ASCII diagrams"
date: "2020-06-05T09:34:13+10:00"
abstract: "In preparation for watching Allan Jude’s BSDCan talk"
thumb: "https://rubenerd.com/files/2020/homelab@1x.jpg"
year: "2020"
category: Hardware
tag:
- bsd
- bsdcan
- commodore
- commodore-128
- freebsd
- infiniband
- netbsd
- networkig
location: Sydney
---
<p><img src="https://rubenerd.com/files/2020/homelab@1x.jpg" srcset="https://rubenerd.com/files/2020/homelab@1x.jpg 1x, https://rubenerd.com/files/2020/homelab@2x.jpg 2x" alt="" style="width:500px" /></p>

The [Homelab session](https://www.bsdcan.org/events/bsdcan_2020/schedule/session/14-homelab-panel/) is the I'm most looking forward to! So many of our careers began as a passionate hobby at home, so I think encouraging more of this sort of thing can only help the BSD community. You can join the live stream free; details are [on the BSDCan website](https://www.bsdcan.org/events/bsdcan_2020/schedule/session/14-homelab-panel/). These are the times:

* 10:15, 05 June Ottawa
* 14:15, 05 June UTC
* 22:15, 05 June Singapore
* 00:15, 06 June Sydney

I thought it'd be a fun evening exercise to make a terrible ASCII-art diagram showing Clara's and my own homelab. I had to unfortunately shed and consolidate a lot of stuff when we moved into our current studio apartment, but fortunately Clara's just as much a nerd as me and is fine having the shelf behind our TV full of wires and loud cooling fans!

<pre style="line-height:1em">
   ╔═════════════════════════╗    ~ Cloud ~
   ║             sasara.moe  ║
   ║  OrionVM High CPU 2 GB  ║   ╔═════════════════════════╗
   ║         FreeBSD 11.4-R  ║   ║           rubenerd.com  ║
   ╟┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈╢   ║  OrionVM Standard 4 GB  ║          
┌──╢  tun0      10.5.5.x/24  ║   ║         FreeBSD 12.1-R  ║
│  ╟┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈╢   ╟┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈╢
│  ║  xn0         Public IP  ║   ║  xn0      (unused ATM)  ║
│  ╟┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈╢   ╟┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈╢
│  ║  xn1       10.4.4.x/24  ╟───╢  xn1       10.4.4.x/24  ║
│  ╚═════════════════════════╝   ╚═════════════════════════╝
│ 
│ 
│ 
│← OPENVPN TUNNEL
│← Probably superfluous for what I use it for, but hey
│ 
│ 
│ 
│    ╔════════════════════════╗
│    ║               mio.lan  ║     ~ Apartment living area ~  
│    ║  HPE MicroServer Gen8  ║
│    ║        FreeBSD 12.1-S  ║     ╔════════════════════════╗
│    ║   FBSD, Debian guests  ║     ║              aino.lan  ║
│    ╟┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈╢     ║  HPE MicroServer Gen8  ║
└────╢  tun0     10.5.5.x/24  ║     ║            NetBSD 9.0  ║
     ╟┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈╢     ╟┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈╢
     ║  ib1     (unused ATM)  ╟─────╢  ib1     (unused ATM)  ║
     ╟┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈╢     ╟┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈╢
     ║  ib0     (unused ATM)  ╟─────╢  ib0     (unused ATM)  ║
     ╟┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈╢     ╟┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈╢
     ║  bge1     10.7.7.x/30  ╟─────╢  bge1     10.7.7.x/30  ║
     ╟┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈╢     ╟┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈╢
  ┌──╢  bge0     10.8.8.x/24  ║  ┌──╢  bge0     10.8.8.x/24  ║
  │  ╟┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈╢  │  ╚════════════════════════╝
  │  ║  bridge0  10.6.6.x/24  ║  │
  │  ╚════════════════════════╝  │  ╔═════════════════════╗
  │                              │  ║         himeko.lan  ║
  │  ╔══════════════════════╗    │  ║      Apple TV Gen3  ║
  └──╢   Unmanaged Netgear  ╟────┘  ╟┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈╢
┌────╢  10-port GbE Switch  ╟───────╢  eth0  10.8.8.x/24  ║
│ ┌──╢         10.8.8.x/24  ╟──┐    ╟┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈╢
│ │  ╚══════════════════════╝  │    ║  wlan0    (unused)  ║
│ │                            │    ╚═════════════════════╝
│ │  ╔══════════════════════╗  │
│ │  ║      Linksys Router  ║  │  ╔════════════════════════╗
│ │  ║             OpenWRT  ║  │  ║           azunyan.lan  ║
│ │  ╟┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈╢  │  ║       Raspberry Pi A+  ║
│ └──╢  lan    10.8.8.x/24  ║  │  ║        FreeBSD 12.1-R  ║
│    ╟┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈╢  │  ╟┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈╢  
│    ║  wan      IPoE DHCP  ║  └──╢  ue0      10.8.8.x/24  ║
│    ╟┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈╢     ╟┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈╢
│    ║  wlan0     (unused)  ║     ║  wlan0  (unsupported)  ║
│    ╟┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈╢     ╟┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈╢
│ ┌┈┈╢  wlan1  10.9.9.x/24  ║     ║  sio0        (serial)  ╟───┐
│ ┊  ╚══════════════════════╝     ╚════════════════════════╝   │
│ ┊                                                            │
│ ┊  ╔════════════════════════════╗   ╔═════════════════════╗  │
│ ┊  ║                   lum.lan  ║   ║              ritsu  ║  │
│ ┊  ║  Panasonic Let's Note RZ6  ║   ║  Commodore 128 PAL  ║  │
│ ┊  ║            FreeBSD 12.1-R  ║   ╟┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈╢  │
│ ┊  ╟┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈╢   ║       Serial, WIP!  ╟──┘
│ ┊  ║  en0     (unused at home)  ║   ╚═════════════════════╝
│ ┊  ╟┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈╢
│ ├┈┈╢  wlan0        10.9.9.x/24  ║
│ ┊  ╚════════════════════════════╝     
│ ┊
│ └┈┈┈┈ Phones, Kindles, etc...
│
│
│
│← TRANS-APARTMENT PIPELINE OF JOYOUS CONNECTIVITY
│← May be hidden under a carpet, cough
│
│
│
│    ╔════════════════════╗        
│    ║       tsuruya.lan  ║
│    ║      DIY PC tower  ║
│    ║    FreeBSD 13.0-C  ║
│    ╟┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈╢        ~ Home office nook ~
│ ┌──╢  en0  10.8.8.x/24  ║
│ │  ╟┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈╢      ╔═════════════════════╗
│ │  ║  en1            -  ║      ║    mactheknife.lan  ║
│ │  ╚════════════════════╝      ║   MacBook Pro 14,2  ║
│ │                              ║        macOS 10.14  ║
│ │  ╔═════════════════════╗     ╟┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈╢
│ └──╢   Unmanaged D-Link  ╟─────╢  eth0  10.8.8.x/24  ║
└────╢  5-port GbE Switch  ╟──┐  ╟┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈╢
 ┌───╢        10.8.8.x/24  ║  │  ║  wlan0           -  ║
 │   ╚═════════════════════╝  │  ╚═════════════════════╝
 │                            │
 │  ╔══════════════════════╗  │  ╔═════════════════════╗
 │  ║             ami.lan  ║  │  ║      clarabook.lan  ║
 │  ║  DIY 200MHz Pentium  ║  │  ║   MacBook Pro 14,3  ║
 │  ║    MS-DOS 6.20, WFW  ║  │  ║        macOS 10.15  ║
 │  ║     Windows 95 OSR2  ║  │  ╟┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈╢
 │  ║    FreeBSD 6.3 i386  ║  └──╢  eth0  10.8.8.x/24  ║
 │  ╟┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈╢     ╟┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈╢
 └──╢  eth0   10.8.8.x/24  ║     ║  wlan0           -  ║
    ╚══════════════════════╝     ╚═════════════════════╝
</pre>

A couple of notes:

* We use InfiniBand extensively at work for synchronous disk replication, and I have some older Mellanox QDR cards in both the MicroServers, but I recently switched one of them to NetBSD as an experiment and don't have experience with IB or running NetworkManager on that OS yet. 

* My SSH to rs232 bridge for either my Commodore 128 or Commodore Plus/4 is only theoretical at this stage, but I'd love to see if it's possible!

* At some point I want to upgrade to 2.5/5GBASE-T for machines that can support it, but it will involve new switches and NICs that are still too pricey. Good news is everything was done with Cat6 when we moved into this tiny apartment :)

* The `mio` MicroServer was recently switched to being a bhyve host instead of just jails, which I haven't figured out how to represent with awful(ly delightful) box-drawing characters. My cloud VMs also run jails. Now that `aino` runs NetBSD, I'd be interested to see if I could make her a Xen host, given that's our bread and butter at work.

* I want to replace the aging home router at some stage.
