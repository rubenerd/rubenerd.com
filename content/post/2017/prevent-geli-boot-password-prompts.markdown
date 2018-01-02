---
title: "Prevent GELI password boot prompts"
date: "2017-07-02T23:30:00+10:00"
abstract: "While the prompt is useful, it’s not always wanted"
category: Software
tag: 
- bsd
- encryption
- geli
- freebsd
- privacy
---
While it can be useful for FreeBSD's geli to prompt for passwords on boot, it's not always wanted. Case in point, you can't BMC or remote access the box to enter the password.

You can prevent this by setting the number of password attempts to zero:

    # echo kern.geom.eli.tries=0 >> /boot/loader.conf

And disable the boot flag on your geli volumes. You may want to be more granular than this:

    # geli attach [-k secret.key] /dev/[disk]
    # geli configure -B /dev/diskid/*.eli

From the geli(8) manpage:

    configure      Change configuration of the given providers.
    [..]
            -b     Set the BOOT flag on the given providers.


