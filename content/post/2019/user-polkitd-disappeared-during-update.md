---
title: "User 'polkitd' disappeared during update"
date: "2019-04-25T23:11:22+10:00"
abstract: "If you get this when updating FreeBSD packages, run pwd_pkdb."
year: "2019"
category: Software
tag:
- bsd
- freebsd
- package-managers
- pkgng
- troubleshooting
location: Sydney
---
I was upgrading packages on an older FreeBSD box with UFS2, like a gentleman, and the process aborted with this:

    [103/168] Installing polkit-0.114_2...
    ===> Creating groups
    Creating group 'polkitd' with gid '565'.
    ===> Creating users
    Creating user 'polkitd' with uid '565'.
    pw: user 'polkitd' disappeared during update
    pkg: PRE-INSTALL script failed

I've only ever seen this once before, and was solved by regenerating the password database, as listed under `Examples` in the `pwd_mkdb(1)` manpage:

	# /usr/sbin/pwd_mkdb -p /etc/master.passwd

