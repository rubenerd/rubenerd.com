---
title: "FreeBSD doesn't need moused for Xorg"
date: "2018-05-02T09:15:10+10:00"
abstract: "It’s often recommended, but isn’t required"
thumb: "https://rubenerd.com/files/stock/tango-input-mouse.svg"
year: "2018"
category: Software
tag:
- bsd
- freebsd
- guides
location: sydney
---
I often see third-party [FreeBSD desktop guides] that include this:

    # pkg install xorg xfce4 slim
    % echo "exec xfce4-session >> ~/.xinitrc"

Xfce remains my pragmatic favourite [after all these years]. But WindowMaker is also wonderful and nostalgic, and tiled window managers are for squares:

    # pkg install windowmaker

The guides then advise you to configure these `/etc/rc.conf` services:

    moused_enable="YES"
    dbus_enable="YES"
    hald_enable="YES"
    slim_enable="YES"

This is all fine, but `moused` isn't necessary. From the manpage:

> The moused utility and the console driver work together to
> support mouse operation in the text console and user programs. 

Your mouse is almost certainly using the `xf86-input-mouse` driver automatically, unless you don't install the Xorg metapackage.

[FreeBSD desktop guides]: https://www.linuxhelp.com/how-to-install-xfce-desktop-in-freebsd/# "LinuxHelp: How to install Xfce desktop in FreeBSD"
[after all these years]: https://rubenerd.com/tag/xfce/ "Blog posts tagged with Xfce"

