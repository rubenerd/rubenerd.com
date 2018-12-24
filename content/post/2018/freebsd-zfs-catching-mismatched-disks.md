---
title: "FreeBSD ZFS catching mismatched disks"
date: "2018-08-13T17:22:38+10:00"
abstract: "invalid vdev specification"
year: "2018"
category: Software
tag:
- bsd
- file-systems
- freebsd
- orionvm
- zfs
- written-in-sydney
---
I was creating a ZFS mirrored pool on a FreeBSD cloud instance with two identical data disks, like a gentleman:

    $ ovm create disk test1 in SY3 with 100g on tier SSD
    $ ovm create disk test2 in SY3 with 10gb on tier SSD
    $ ovm attach disk test1 to VM test
    $ ovm attach disk test2 to VM test

And then on the VM:

    # glabel test1 /dev/ada1
    # glabel test2 /dev/ada2
    # zpool create [options] mirror tank \
        /dev/label/test1 /dev/label/test2

Output:

    ==> invalid vdev specification
    ==> use '-f' to override the following errors:
    ==>   mirror contains devices of different sizes

Whoops! Turns out they were less identical than I realised. You've have thought the monospace font not lining up during provisioning would have been a clue. Either way, good to know. Also, derp.

