---
title: "Booting FreeBSD off the HPE MicroServer Gen8 ODD SATA port"
date: "2020-06-07T09:55:55+10:00"
abstract: "It’s not straight forward, but you can bootstrap something"
thumb: "https://rubenerd.com/files/2019/fleet-companioncube@1x.jpg"
year: "2020"
category: Hardware
tag:
- bsd
- freebsd
- homelab
- microserver
location: Sydney
---
My [small homelab post](https://rubenerd.com/my-humble-homelab-with-ascii-diagrams/) generated a ton of questions and comments, most of them specific to running FreeBSD on the HP MicroServer. I'll try and answer these over the coming week.

Josh Paxton emailed to ask how I got FreeBSD booting on it, given the unconventional booting limitations of the hardware. I thought I wrote about it a few years ago, but maybe it's on my proverbial draft heap. If you're impatient, the [script is in my lunchbox](https://github.com/rubenerd/rubens-lunchbox/blob/master/odd-microserver-freebsd-boot.sh).

<img src="https://rubenerd.com/files/2019/fleet-companioncube@1x.jpg" srcset="https://rubenerd.com/files/2019/fleet-companioncube@1x.jpg 1x, https://rubenerd.com/files/2019/fleet-companioncube@2x.jpg 2x" alt="" style="width:128px; float:right; margin:0 0 1em 2em;" />

For some background, the Gen8 MicroServer has a SATA backplane for four <abbr title="large form factor">LFF</abbr> drives, and another SATA port intended for a slim optical drive as you can see in the image. Most of us use it for an SSD instead, so we can keep the primary drive bays for storage. The problem is, that extra SATA port isn't bootable when using the server in ACPI mode if there are any other SATA drives in the system. It's the only thing about these otherwise-capable boxes that drives me crazy.

The first approach is to enable the onboard RAID controller, create a logical drive group consisting of just the SSD, and set it bootable. This worked with Windows Server during a brief experiment, but it kernel panics every BSD within seconds of clearing their boot loaders. I'd also prefer not hainvg the RAID controller between me and drives if I don't need it. 

The alternative is to install FreeBSD on the extra SSD, then install a bootloader on a USB key that you can leave attached to the internal USB port, or an external one. 

After installing FreeBSD but before restarting, drop to a shell when offered to. Assuming your new boot key is `da1`, clear whatever partitions you have first, then format it: 

    # gpart destroy -F da1
    # gpart create -s GPT da1

Install the bootloader:

    # gpart bootcode -b /boot/boot0 da1

Then assuming all four LFF drive bays are populated, configure the bootloader with the fifth (SSD) drive, and set as the default boot selection:

    # boot0cfg -Bv -o setdrv -d 0x84 -s 5 da1

`0x84` refers to the fifth BIOS drive. Use these if you have others:

* `0x80` – for just the SSD (though I suppose that's redundant)
* `0x81` – one other drive installed
* `0x82` – two other drives installed
* `0x83` – three other drives isntalled
* `0x84` – all four other drives installed

The flags are:

    -B         install FreeBSD's boot0 manager
    -v         like my blog, be verbose
    -o setdrv  refer to the disk by BIOS drive number
    -d         BIOS drive number
    -s 5       boot from second disk; in this case the SSD 

There are a few different ways you could do this, but this has worked for me for years now.

The main limitation here is if you add more internal drives later, you'll need to update your boot loader with a revised address. If you forget to, you can always boot the FreeBSD installer and drop to a shell to update again. Chances are though you already have all the drives populated; it's most of the point of having these little boxes.

If your MicroServer still refuses to boot, as one of mine did, attach the bootable USB key to one of the external USB 2.0 ports instead. I might just have a flaky internal port on one of mine, but it worked fine in my other one here, and in the unit I keep up at my dad's place which I just realised I forgot to add to my homelab post.

Thanks to [rickvanderzwet](https://forums.freebsd.org/threads/hp-gen8-microserver-booting-from-a-separate-bootloader.57297/post-334517) on the FreeBSD Forums for pointing this out back in 2016, I hadn't even considered this at the time.

