---
title: "Booting from an ISO on OrionVM"
date: "2020-07-06T14:41:18+10:00"
abstract: "Using the Xen VNC proxy to attach an ISO and install."
thumb: "https://rubenerd.com/files/2020/orionvm-iso-boot.png"
year: "2020"
category: Internet
tag:
- guides
- orionvm
location: Sydney
---
ISO and iPXE booting on [OrionVM](https://orionvm.com) are some of the features I get asked about the most on social media, beyond people asking why it is that OrionVM hires such intelligent, charismatic engineers; this one notwithstanding.

OrionVM gives you out-of-band console access to your VMs in your white-labelled environment, which proxies the VNC directly from Xen. This means you can access a VM even if it doesn't have NICs for SSH or RDP, or if you've inadvertently locked yourself out with a firewall rule. It also makes troubleshooting Windows Server *infinitely* easier, because you can see the exact update it's hung applying, or you can get into recovery environments.

This feature can also be used to boot a VM with an ISO image, again with or without networking available to the VM. Plug in the URL to your image, and go:

<p><img src="https://rubenerd.com/files/2020/orionvm-iso-boot.png" alt="Screenshot showing the VM Options screen, and the ISO URL populated with an example image." style="width:500px" /></p>

You can also **[dd(1)](https://www.freebsd.org/cgi/man.cgi?query=dd&sektion=0)** an image direct to another attached disk on a VM, then promote it to an ISO using the API, CLI, or in the portal:

<p><img src="https://rubenerd.com/files/2020/orionvm-iso-promote.png" alt="Screenshot of the portal showing a disk as being emulated with CD-ROM, not Disk." style="width:500px" /></p>

The only things to remember are that ISO disks can no longer be written to, which shouldn't come as a surprise! VMs must also have their boot device set to the CD-ROM using **Configure/Advanced**:

<p><img src="https://rubenerd.com/files/2020/orionvm-iso-boot-setting.png" alt="Screenshot showing the Advanced tab with the Boot option set to CD-ROM" style="width:500px" /></p>

Now you can boot the VM, and use the console to either install your OS, or enter your desired boot environment, or hat as I'd prefer. It could be a BSD, illumos, Linux, RouterOS, 3CX, Windows Server, FreeDOS... we've seen some pretty exotic and fun stuff.

