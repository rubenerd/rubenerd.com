---
title: "Upgrading and locking FreeBSD 10+ ports in pkgng"
date: "2016-01-12T17:22:00+10:00"
abstract: "Lock packages to prevent them being overwritten"
year: "2016"
location: Sydney
category: Software
tag:
- bsd
- freebsd
- package-managers
- pkgng
- ports
---
I was [very excited][excite] when [pkgng][pkgng] came to FreeBSD (and [pkgin][pkgin] on pkgsrc/NetBSD). It does make some aspects of maintaining a BSD system easier, though there are few new gotchas.

Ports you build on FreeBSD 10.0+ are subseqently registered as packages with pkgng. So if you install nginx-devel as such:

    # portsnap fetch extract
    # cd /usr/ports/www/nginx-devel
    # make install clean

This will appear as a package:

    # pkg list
    [..]
    nginx-devel-1.9.9   Robust and small WWW server

Where this can become an issue is if you have custom build options. Because pkgng treats this as a regular package, issuing an upgrade will overwrite it with the generic options the tireless FreeBSD volunteer built it with.

    # pkg update
    # pkg upgrade

    => The following 1 package(s) will be affected (of 0 checked):
    =>
    => Installed packages to be UPGRADED:
    =>     nginx-devel-1.9.9

The accepted way around this is to lock the package to prevent upgrades:

    # pkg lock nginx

Be careful though! As I did above, I locked a package I didn't have installed. pkgng allows for this, but the end result is an upgrade will still overwrite what you intended to lock. This is easy to do with all ports that have extensions to their names, such as vim-lite, mtr-nox11 and p5-shimapan.

    # pkg lock nginx-devel
    => nginx-devel-1.9.9: lock this package? [y/N]: y
    Locking nginx-devel-1.9.9

Now when we do an upgrade, your original port won't be overwritten.

[excite]: https://rubenerd.com/pkgin-pkgng-pkgwin/
[pkgng]: https://www.freebsd.org/doc/handbook/pkgng-intro.html
[pkgin]: http://pkgin.net/

