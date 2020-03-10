---
title: "FreeBSD 12.1 Nvidia desktop"
date: "2020-03-02T09:09:03+11:00"
abstract: "It was easier than I remembered."
thumb: "https://rubenerd.com/files/2020/screenie-xfce-freebsd-nvidia@1x.png"
year: "2020"
category: Software
tag:
- bsd
- drivers
- freebsd
- graphics
- nvidia
- xfce
location: Sydney
---
Last weekend I finally got around to dual-booting FreeBSD 12.1 on my home tower. It'd been on the 11.x branch for a long time, and I used the opportunity to start fresh. It was originally built as a budget game machine for world-building, so it has a Skylake i5 and a Nvidia GTX 970.

It was quicker to get a FreeBSD Nvidia desktop going than I expected, but there were still a couple of gotchas.


### Optional preparation

The first thing I always do is create a `zfs` dataset for the ports system, so I can use snapshots to try new software, or troubleshoot updates. You'll probably also want the `latest` packages over `quarterly` for desktop use.

    # zfs create zroot/usr/local
    # mkdir -p /usr/local/etc/pkg/repos
    # cp /etc/pkg/FreeBSD.conf /usr/local/etc/pkg/repos/FreeBSD.conf
    # sed -i '' 's/quarterly/latest/' /usr/local/etc/pkg/repos/FreeBSD.conf
    # pkg bootstrap
    # pkg update


### Desktop essentials

These are the drivers and basics for a desktop you need:
   
    # pkg install nvidia-drivers nvidia-settings dbus xorg
    # sysrc dbus_enable=YES
    # sysrc kld_list="nvidia-modeset linux"

Next, create `/usr/local/etc/X11/xorg.conf.d/nvidia-driver.conf` to tell Xorg to use the nvidia driver rather than a fallback:

    Section "Device"
        Identifier "NVIDIA Card"
        VendorName "NVIDIA Corporation"
        Driver "nvidia"
    EndSection

Then reboot to make sure everything comes up cleanly.

<p><img src="https://rubenerd.com/files/2020/screenie-xfce-freebsd-nvidia@1x.png" srcset="https://rubenerd.com/files/2020/screenie-xfce-freebsd-nvidia@1x.png 1x, https://rubenerd.com/files/2020/screenie-xfce-freebsd-nvidia@2x.png 2x" alt="" style="width:500px" /></p>


### Aside: Not using kld_load?

Note that I used `kld_list` in my `/etc/rc.conf` above. Most guides suggest you do this instead:

    # sysrc kld_load="nvidia-modeset"
    # echo 'linux_enable="YES"' >> /boot/loader.conf

This no longer automatically loaded it for me in FreeBSD 12.1, as keleathi has also noticed on the [FreeBSD forums](https://forums.freebsd.org/threads/nvidia-modeset-not-loading-from-loader-conf-after-upgrade-from-12-to-12-1.73564/). If someone knows why that might be the case, please feel free to [tweet me](https://twitter.com/rubenerd). With both of those in place I still needed to manually load `nvidia-modeset` after each boot:

    # kldload nvidia-modeset
    ==> nvidia0: <Unknown> on vgapci0
    ==> vgapci0: child nvidia0 requested pci_enable_io
    ==> vgapci0: child nvidia0 requested pci_enable_io


### Install your desktop

I'm using [Lumina](https://www.freshports.org/x11/lumina/) on my laptop with Allan Jude's recommendation&mdash;post coming!&mdash;but I've been a fan of [Xfce](https://www.freshports.org/x11-wm/xfce4/) since almost the beginning of my \*nix experience, so it gets pride of place on my desktops:

    # pkg install xfce xfce4-goodies xfce4-places-plugin
    $ echo ". /usr/local/etc/xdg/xfce4/xinitrc" > ~/.xinitrc
    $ ln -s ~/.xinitrc ~/.xession
    $ startx

