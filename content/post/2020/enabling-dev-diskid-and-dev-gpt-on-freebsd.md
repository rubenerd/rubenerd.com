---
title: "Enabling /dev/diskid and /dev/gpt on FreeBSD"
date: "2020-01-01T18:45:58+11:00"
abstract: "Enable the appropriate GEOM lines in loader.conf"
year: "2020"
category: Software
tag:
- bsd
- drives 
- freebsd
- geom
location: Sydney
---
Last year I wrote about buying and testing a [new external RAID box](https://rubenerd.com/jaycar-external-raid-box-with-zfs/) for additional storage on one of my home FreeBSD file servers. I tend to not like these kind of enclosures: they're often built with flaky controllers, the cases themselves tend to be flimsy, and you often can't swap the drive into a regular sled after the fact because they write additional metadata to the disk. But they're useful in a pinch, provided you have sufficient backups.

I mentioned in my post on the subject that FreeBSD's GEOM subsystem automatically creates convenient serial number symlinks for most drives,  and you can always fall back to labelling manually with `gpart(8)` for drives that don't have guaranteed unique serial numbers.

I should reiterate that it's good practice to always label your drives manually as well, even if FreeBSD does the initial symlinking for you. You can provide additional context to the drive, such as its sled location, part number, or the date of installation. I admitted in the linked post that I usually don't bother for personal use, but I always do in professional settings.

The result of the GEOM subsystem detecting these drives is a handy, human-readable set of aliases. Here's a standard `diskid` that's detected the serial number of one of the SATA drives:

    /dev/diskid/DISK-1SGHNMHZ --> /dev/ada0

And another that I labelled myself using `gpart(8)`:

    /dev/gpt/8TB-YHGWWS1A --> /dev/da0

You may have also witnessed this behavior when attaching `geli(8)` encrypted volumes; the pronunciation of which I'm grateful to Allan Jude for correcting. So imagine my surprise when these folders didn't populate with any of my drives on fresh FreeBSD 12.1 install, despite the GPT labels being intact and the other drives showing serial numbers in `dmesg(8)`. I thought I had a screw loose somewhere, or at least an symlink to one.

The solution is to enable the appropriate `geom(8)` lines in `/boot/loader.conf` where appropriate. This for `diskid`:

    kern.geom.label.disk_ident.enable="1"

And this for GPT disks:

    kern.geom.label.gptid.enable="1" 

You'll have all your drive symlinks back upon rebooting.

