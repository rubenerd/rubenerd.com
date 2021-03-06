---
title: "Required Nagios email alert packages"
date: "2015-11-25T16:04:00+10:00"
abstract: "Install postfix and heirloom-mailx"
year: "2015"
category: Software
tag:
- bsd
- debian
- freebsd
- guides
- linux
- monitoring
- nagios
- netbsd
---
Nagios saves me more sleep than I care to admit, but configuring its email alerts if you build from source requires a little more finesse. Specifically, you need postfix (likely you already have) and heirloom-mailx.

On Debian (and probably Ubuntu, but check first):

    apt-get install heirloom-mailx

On FreeBSD:

    cd /usr/ports/mail/heirloom-mailx
    make install clean

And NetBSD's pkgsrc:

    cd /usr/pkg/mail/heirloom-mailx
    make install clean

The BSDs also have binary versions in pkgng/pkgin, ports and pkgsrc. That's a lot of package managers.

