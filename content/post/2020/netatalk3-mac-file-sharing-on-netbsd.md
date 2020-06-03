---
title: "Netatalk3 Mac file sharing on NetBSD"
date: "2020-05-28T08:16:34+10:00"
abstract: "Remember to copy the rc.d scripts from pkg/share/examples"
thumb: "https://rubenerd.com/files/2020/netbsd@2x.png"
year: "2020"
category: Software
tag:
- bsd
- guides
- macos
- netbsd
- netatalk
location: Sydney
---
This is the latest installment of my unintentional [NetBSD](https://rubenerd.com/tag/netbsd/) for FreeBSD users blog post series! This is the minimum viable process to get [netatalk3](https://pkgsrc.se/net/netatalk3) on NetBSD, assuming you've configured pkgin:

    # pkgin install netatalk3
    # cp /usr/pkg/share/examples/rc.d/netatalk /etc/rc.d/

Normally I back up any package-provided configs to a `.orig` file first, but there's a example config in `/usr/pkg/share/examples/netatalk` you can restore from.

    # vi /usr/local/etc/afp.conf
    ==> ksh: /usr/local/etc/afp.conf: not found

Whoops, head is still in FreeBSD land.
 
    # vi /usr/pkg/etc/netatalk/afp.conf

And set up to start:

    # echo netatalk=YES >> /etc/rc.conf
    # service netatalk start 

On FreeBSD I separate my rc scripts from the base system in `/usr/local/etc/rc.d`. NetBSD guides on the official wiki and on forums say to just use `/etc/rc.d`, but let me know if you're a NetBSD user and think I should do something similar.

And special thanks to [hauke](https://pkgsrc.se/bbmaint.php?maint=hauke|a|NetBSD.org) for maintaining netatalk3 on pkgsrc.

