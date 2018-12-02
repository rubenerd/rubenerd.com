---
title: "macOS guest in VMware Fusion"
date: "2018-11-21T08:40:39+11:00"
abstract: "They have steps to do it"
year: "2018"
location: Sydney
category: Thoughts
tag:
- apple
- macos
- virtualisation
- vmware-fusion
---
You can legally run macOS 10.12 in a virtual machine, provided the hypervisor is itself a Mac. The suggested approach is to use the Recovery Partition on your Mac as the basis for a new macOS virtual machine in VMware Fusion, but this never worked for me.

VMware [lists these steps] for installing macOS using the app package downloaded from the Mac App Store:

1. Start VMware Fusion.
2. Select File > New.
3. Drag Install macOS Sierra.app and drop it into the Create a Virtual Machine window.
4. Click Continue.
5. Follow the prompts to complete the installation.
6. Install VMware Tools.

I'd tried Sierra and High Sierra on my 27-inch iMac, but the macOS installer doesn't let me progress beyond the initial menu. I'm going to try Mojave on my new MacBook Pro and report back.

If I could get OS/2 going, surely I can get macOS!

[lists these steps]: http://partnerweb.vmware.com/GOSIG/MacOS_10_12.htm

