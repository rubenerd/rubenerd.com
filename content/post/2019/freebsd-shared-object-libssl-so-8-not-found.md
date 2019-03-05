---
title: "FreeBSD shared object libssl.so.8 not found"
date: "2019-02-18T17:14:30+11:00"
abstract: "Troubleshooting version mismatches from freebsd-update and pkgng."
year: "2019"
category: Software
tag:
- bsd
- freebsd
- package-managers
- pkgng
- troubleshooting
- updates
location: sydney
---
I was helping a client with their FreeBSD install on the weekend, and she was having trouble with pkg. We sorted it out, and I was granted permission to share.

When she attempted to update a package:

    ==> lf-elf.so.1: Shared object "libssl.so.8" not found required by "pkg".

This is usually indicitive of a system version mismatch, such as running FreeBSD 11.x packages on a system upgraded to 12 with freebsd-update. THe recommended solution is to reinstall pkgng with:

    # pkg-static install -f pkg

If this still doesn't work, you can force pkgng to boostrap:

    # pkg-static bookstrap -f
        
    ==> Major OS version upgrade detected. Running "pkg-static install -f pkg" recommended.
    ==> pkg(8) is already installed. Forcing reinstallation through pkg(7).

It's also worth checking your `/etc/pkg/FreeBSD.conf` to see if it changed from `latest` to `quarterly` if you elected to use the former before.

Now you can update your repo, then upgrade and install packages as before:

    # pkg update
    ==> All respositories are up to date

