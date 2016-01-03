---
title: "FreeBSD pkgng not installing packages"
---
For some reason, FreeBSD's new pkgng tool (pkg from the shell) wasn't finding any packages, which resulted in them not being updatable or installable. Darn.

    root@news:~ # pkg update
    Updating FreeBSD repository catalogue...
    FreeBSD repository is up-to-date.
    All repositories are up-to-date.

So I issued a forced update:

    root@news:~ # pkg update -f
    Updating FreeBSD repository catalogue...
    Fetching meta.txz: 100%    944 B   0.9kB/s    00:01    
    Fetching packagesite.txz: 100%    5 MiB 425.2kB/s    00:13    
    Processing entries: 100%
    FreeBSD repository update completed. 24608 packages processed.

Aha! That's looking better. Just to confirm:

    root@news:~ # pkg check -Ba
    Checking all packages:  100%
    Checking all packages: 100%

Now I could install packages.

