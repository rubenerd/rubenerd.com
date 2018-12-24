---
title: "Greyed out VMware Fusion NIC settings"
date: "2018-12-01T12:06:27+11:00"
abstract: "The all-too-familiar bug asserts itself again"
year: "2018"
category: Software
tag:
- bsd
- freebsd
- vmware
- vmware-fusion
- written-in-sydney
---
I've yet to upgrade to VMware Fusion 11 from 10, but I've been bitten by the all-too-familiar greyed out network options bug again. If you go to configure the NIC for a VM, you're presented with this quandary:

<p><img src="https://rubenerd.com/files/2018/vmware-fusion10-nic@2x.png" alt="Screenshot showing greyed out options for the Network Adaptor." style="width:500px; height:379px;" /></p>

You can't change to Bridged Networking at all, even if you uncheck and recheck *Connect Network Adaptor*, or remove the NIC and add it again.

The GUI semi-workaround is the same for whenever this happens. When the VM is running, click the *Virtual Machine* menu, hover over *Network Adaptor*, and choose your desired setting.

<p><img src="https://rubenerd.com/files/2018/vmware-fusion-menu10@2x.png" alt="Screenshot showing the above menu." style="width:500px; height:143px;" /></p>

schmitgreg over on the VMware Communities forum also [suggests some file removals] to restore this functionality, which I haven't tried yet.

I was one of the beta testers for the [original Parallels Desktop] and VMware Fusion back in the day. The former seemed more polished, but I ended up [buying Fusion] for its FreeBSD support and better compatibility with other VMware systems for work. A little birdie at AsiaBSDCon in Tokyo joked that a surprising amout of bhyve was written on Fusion.

But these niggling issues do keep cropping up, a decade later.

[suggests some file removals]: https://communities.vmware.com/thread/497477
[buying Fusion]: https://rubenerd.com/just-bought-vmware-fusion/
[original Parallels Desktop]: https://rubenerd.com/parallels-desktop-freebsd-issues/

