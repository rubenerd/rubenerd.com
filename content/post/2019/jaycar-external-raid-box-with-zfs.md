---
title: "Jaycar external RAID box with FreeBSD and ZFS"
date: "2019-06-17T08:45:24+10:00"
abstract: "I learned why relying on a drive or RAID's serial numbers for building my zpools isn't always the best!"
thumb: "https://rubenerd.com/files/2019/jaycar-enclosure@1x.jpg"
year: "2019"
category: Hardware
tag:
- bsd
- freebsd
- geli
- glabel
- gpart
- hard-drives
- jaycar
- jbod
- storage
- zfs
location: Sydney
---
Last Friday I bought a OEM 2-bay external RAID enclosure as a silly present. Jaycar's discounted price was cheaper than eBay, and I needed a quick way to expand my home server.

I don't trust external USB enclosures for critical data; their controllers are usually bargain basement and can behave in unexpected ways, as we'll see in a moment. But for home server experiments, or if you use its basic default RAID, they're probably fine... or as fine as any data can be without ZFS. Which is to say, *I hope it's not important!*

<p><img src="https://rubenerd.com/files/2019/jaycar-enclosure@1x.jpg" srcset="https://rubenerd.com/files/2019/jaycar-enclosure@1x.jpg 1x, https://rubenerd.com/files/2019/jaycar-enclosure@2x.jpg 2x" alt="" style="width:436px; height:337px;" /></p>

The enclosure supports your usual RAID 0, RAID 1, and spanning, but more importantly it could work as a JBOD with individual drives exposed to the OS. If you use ZFS, which you should, you always want it managing your RAID.

This was `dmesg` once plugging it in:

    ugen1.2: <JMicron JMS56x Series> at usbus1
    umass1 on uhub3
    umass1: <MSC Bulk-Only Transfer> on usbus1
    umass1:  SCSI over Bulk-Only; quirks = 0x8000
    umass1:8:1: Attached to scbus8

The [manufacturer's website](http://www.jmicron.com/PDF/brief/jms567.pdf) lists the JMS56x as a "low power consumption and high performance USB 3.0 to SATA 6.0Gbps (bit per second) Bridge controller" with Windows Hardware Certification and upgradeable firmware. Someone with more hardware knowledge could read the brief and glean more detail.

So I plugged in two drives I had spare.

    da1 at umass-sim1 bus 1 scbus8 target 0 lun 0
    da1: <WDC WD40 EZRZ-00GXCB0 0003> Fixed Direct Access SPC-4 SCSI device
    da1: Serial Number RANDOMF4917AD758C4
    da1: 400.000MB/s transfers
    da1: 3815447MB (7814037168 512 byte sectors)
    da1: quirks=0x2<NO_6_BYTE>
    da2 at umass-sim1 bus 1 scbus8 target 0 lun 1
    da2: <WDC WD40 EZRX-00SPEB0 0003> Fixed Direct Access SPC-4 SCSI device
    da2: Serial Number RANDOMF4917AD758C4
    da2: 400.000MB/s transfers
    da2: 3815447MB (7814037168 512 byte sectors)
    da2: quirks=0xa<NO_6_BYTE,4K>

Keen-eyed sysadmins may already see a wrinkle, but at that stage I thought so far so good. I can see a `da1` and `da2`, so there are two drives. Time to configure with ZFS, and give them a spin. Ah man, that pun was on *point*.

At a high level you can configure a ZFS mirror like this:

    # zpool create [options] tank mirror /dev/da1 /dev/da2

This is ill advised, because these identifiers may change, and you have no way to map them to the physical world. The conventional wisdom is to use labels, either with `glabel`, or when making a partition table with GPT as below:

    # gpart create -s gpt da1
    # gpart add -a 4k -l WD-SERIALNO -t freebsd-zfs da1
    ==> da1p1 added

Here's where I make a dirty confession: I skip this for personal drives. FreeBSD automatically creates references for drives by their serial number, so you can use them immediately as such:

    /dev/diskid/DISK-SERIALNO

But here's where things got interesting with this enclosure. When I went to check that folder, and again with `glabel status`, only `da1` appeared. I checked `dmesg` again, and sure enough:

    da1: Serial Number RANDOMF4917AD758C4
    da2: Serial Number RANDOMF4917AD758C4

*Sad trombone!* I made the mistake back in the day when using a `glabel` that was too long, and it truncated them to be the same. Then overlaid GELI encryption and overwrote the label. Either way, this ruled out my lazy shortcut.

Fortunately, I could use the above `gpart` steps to create unique identifiers based on their serial numbers. Then I reference them from the gpt folder:

    # zpool create tank mirror \
        /dev/gpt/WD-SERIALNO1 \
        /dev/gpt/WD-SERIALNO2

And now it's ready to go. One thing I didn't mention was the step involving setting up GELI for encryption, which you'd do before creating your zpool. This won't have any important or confidential data, but it makes sending drives back under warranty much easier knowing the data on it is electronic noise.

