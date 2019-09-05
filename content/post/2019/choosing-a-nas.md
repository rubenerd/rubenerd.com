---
title: "Choosing a NAS"
date: "2019-08-07T10:22:14+10:00"
abstract: "Comparing OEM boxes, Synology-style devices, dedicated FreeBSD servers, and the excellent FreeNAS Mini hardware."
thumb: "https://rubenerd.com/files/2019/freenasmini-hpmicroserver@1x.jpg"
year: "2019"
category: Hardware
tag:
- bsd
- freebsd
- nas
- storage
- zfs
location: Sydney
---
A few people have asked me iRL and online what I use for a network-attached storage device, or if there's any specifically I recommend. If you don't want to read further, go for a [FreeNAS Mini E](https://www.ixsystems.com/freenas-mini/), they're *excellent* machines with the world's best software for data integrity.

These are the features that make a good NAS:

* More storage than a typical external drive
* Shareable storage across devices
* Data redundancy, such that it can still operate in a degraded state
* Data integrity checks for irreplaceable media, to mitigate bit rot
* Higher performance than an external drive
* Ability to install software like PleX

<p><img src="https://rubenerd.com/files/2019/freenasmini-hpmicroserver@1x.jpg" srcset="https://rubenerd.com/files/2019/freenasmini-hpmicroserver@1x.jpg 1x, https://rubenerd.com/files/2019/freenasmini-hpmicroserver@2x.jpg 2x" alt="" style="width:500px" /></p>

You've got a few options:

* A set-and-forget box like a Synology or Drobo. I don't have much personal experience with them, but we have clients at work who swear by them. If you don't want to mess with server configuration, they're still black boxes and expensive, but they're easy.

* Cloud. Provided you can encrypt the data locally, you have a fat enough internet pipe – which rules out Australia – and you're running a nice FreeBSD ZFS server on a good cloud that offers it as a Tier-1 template, it could work for some use cases.

* Adding extra storage to a desktop and running Mac CoreStorage, or an NTFS mirror, etc. Leaving aside almost nobody has desktops that can take drives anymore, even new file systems like APFS don't offer proper data integrity checks `#picardfacepalm`. You also run the risk of data loss if your desktop OS gets hosed.

* A cheaper NAS box from a no-name or OEM. These are cheaper and usually have toggle switches to choose what RAID level you want. The only time I use them is if they offer a JBOD mode, so they expose all their drives individually to a target server so I can run ZFS on them. Otherwise, I don't trust them.

* A small home server running ZFS on FreeNAS or straight FreeBSD, like an iXsystems [FreeNAS Mini](https://www.ixsystems.com/freenas-mini/) or an [HP MicroServer](https://www.hpe.com/au/en/product-catalog/servers/proliant-servers/pip.hpe-proliant-microserver-gen10.1009955118.html). These do require a little more configuration but they're the only solution that meets all my criteria. OpenZFS also runs well on Linux, but the extent to which ZFS is integrated into FreeBSD's tooling make it much simpler, especially if you ever want to branch out and run software like PleX in a jail.

The final thing to keep in mind: don't overthink it. If you have a portable external drive that you backup data from your laptop, you already do more than the vast majority of people. When you think you're ready to step up, maybe there's something here that's useful.

