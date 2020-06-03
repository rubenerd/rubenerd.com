---
title: "Colour ls on NetBSD"
date: "2020-05-25T16:37:55+10:00"
abstract: "And colordiff, colortail while we’re at it."
thumb: "https://rubenerd.com/files/uploads/netbsd-smaller-crop.png"
year: "2020"
category: Software
tag:
- bsd
- freebsd
- colour
location: Sydney
---
I realised using [NetBSD](https://www.netbsd.org/) in [my homelab again](https://rubenerd.com/encrypted-zfs-on-netbsd-9-for-a-freebsd-guy/) just how much I'd come to rely upon colour as a visual cue. `-F` gets you useful hints like like `/` for directories and `@` for symbolic links. But a week in, I do miss `CLICOLOR=1` on FreeBSD.

NetBSD pkgsrc has [colorls](https://pkgsrc.se/misc/colorls), which is easy enough to alias:

    # pkgin install colorls
        
    # echo alias ls="/usr/pkg/bin/colorls -FG" >> ~/.profile
    # echo alias la="/usr/pkg/bin/colorls -aFG" >> ~/.profile

While I'm on the subject, [colordiff](https://pkgsrc.se/devel/colordiff) does the same thing for diff, and [colortail](https://pkgsrc.se/misc/colortail) works wonders for immediately highlighting errors while tailing logs to troubleshoot.

