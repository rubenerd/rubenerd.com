---
title: "FreeBSD 12.1 on a new (to me) ThinkPad T550"
date: "2020-03-24T18:06:34+11:00"
abstract: "Got a second-hand T550 for my birthday"
thumb: "https://rubenerd.com/files/2020/thinkpad550@2x.jpg"
year: "2020"
category: Hardware
tag:
- bsd
- freebsd 
- thinkpads
location: Sydney
---
I picked up a second-hand ThinkPad T550 for my birthday this week, to replace my aging FreeBSD tower I don't have space for in this studio apartment. Between this and hopefully a new MacBook Pro without an awful keyboard this year, I'll have the two "desktop" machines I need to do my daily work and personal tinkering.

Unlike my gorgeous little Panasonic Let's Note which took a lot of work, ThinkPads are well supported out-of-the-box with FreeBSD, owing to the predilicion of the developers for them.

<p><img src="https://rubenerd.com/files/2020/thinkpad550@1x.jpg" srcset="https://rubenerd.com/files/2020/thinkpad550@1x.jpg 1x, https://rubenerd.com/files/2020/thinkpad550@2x.jpg 2x" alt="Press shot of the ThinkPad T550" style="width:320px" /></p>


### BIOS prep work

I've never had to enter a BIOS with **ENTER** before. I do miss the blue ThinkCentre button on that extra row of keys.
 
* Under Config &rarr; Total Graphics Memory, set from 256 to 512 MB. This model doesn't have the discrete GPU option, so this is important.

* Under Security &rarr; Virtualisation, enable **Intel (R) Virtualization Technology** and **Intel (R) VT-d Feature**. You won't have a healthy [bhyve](https://bhyvecon.org/) without it.

I read there's no point disabling the TouchPad in the BIOS anymore because it now just sends a signal to the Windows driver. I don't find myself brushing against it while using the superior TrackPoint we all know and love, but I presume this would be easy enough to disable in FreeBSD.


### Graphics

This machine has an Intel HD Graphics 5500:

    # pciconf -lv | grep -B2 Graphics
    ==> vendor = 'Intel Corporation'
    ==> device = 'HD Graphics 5500'

This is supported with drm-kmod. Note the `kld_list` *not* `kld_load`; thanks to everyone on the FreeBSD mailing lists for helping me out with that:

    # pkg install drm-kmod
    # sysrc kld_list="/boot/modules/i915kms.ko"
    # shutdown -r now

I did see slight screen tearing when scrolling in Xfce, but this was resolved by adding these to `/boot/loader.conf` as [Terpentijn suggested](https://forums.freebsd.org/threads/intel-video-and-screentearing.72085/post-438483) on the forums:

    drm.i915.enable_rc6=7
    drm.i915.semaphores="1"
    drm.i915.enable_fbc="1"

FreeBSD 12.1-RELEASE had an [open issue in errata](https://www.freebsd.org/releases/12.1R/errata.html#errata) about [drm-kmod](https://www.freshports.org/graphics/drm-kmod/) being built on 12.0, which had an incompatible kernel. The newest packages are [now built with 12.1](https://bugs.freebsd.org/bugzilla/show_bug.cgi?id=241101#c28), so you can use packages to install.


### Wi-Fi

This will mostly sit on my desk with wired Ethernet, but Wi-Fi would still be useful. It has an Intel Wireless 7265 card which is supported by [iwm(4)](https://www.freebsd.org/cgi/man.cgi?query=iwm&apropos=0&sektion=0). It's sufficient now just having the following in `/etc/rc.conf`:

    sysrc wlans_iwm0="wlan0"
    sysrc ifconfig_wlan0="WPA DHCP powersave"

If you need to load the drivers manually, make sure you use the 7265***D*** driver as per the [manpage](https://www.freebsd.org/cgi/man.cgi?query=iwmfw&sektion=4), [wiki](https://wiki.freebsd.org/Laptops/Thinkpad_T550), and [wireless mailing list](https://lists.freebsd.org/pipermail/freebsd-wireless/2017-March/007570.html):

    echo if_iwm_load="YES" >> /boot/loader.conf
    echo iwm7265Dfw_load="YES" >> /boot/loader.conf

I'd say this 90% works. On one boot since I got it the card complained it couldn't scan for networks. I left it an hour, and it worked again. Not sure if it's a flaky card or driver yet.


### Sound

Checking hardware, we've got internal speakers and the ability to play through HDMI:

    # cat /dev/sndstat
    Installed devices:
    pcm0: <Intel Broadwell (HDMI/DP 8ch)> (play)
    pcm1: <Realtek ALC292 (Analog 2.0+HP/2.0)> (play/rec) default
    pcm2: <Realtek ALC292 (Internal Analog Mic)> (rec)

It should use the internal speaker by default, but in case you need to set:

    # sysctl hw.snd.default_unit=1
    # echo hw.snd.default_unit=1

I haven't tested HDMI, but audio just works with:

    echo snd_hda_load="YES" >> /boot/loader.conf


### Conclusion

This is more a proof of concept; if I end up liking this setup my plan is to get a newer model with a discrete GPU and a HiDPI screen. ThinkPads have the industry's best keyboards, but their non-HiDPI screens have low contrast, uneven backlighting, and the resolution isn't great. It's fine for writing and code, but I'll still do all my photo editing and such on Macs.

Next steps are to get the brightness and volume controls working, and suspend/resume. The [wiki](https://wiki.freebsd.org/Laptops/Thinkpad_T550) and [manpages](https://www.freebsd.org/cgi/man.cgi?query=acpi_ibm&sektion=4) suggest this shouldn't be too difficult.

