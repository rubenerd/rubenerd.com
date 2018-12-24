---
title: "Could not chdir to fulljail"
date: "2018-12-22T13:15:42+11:00"
abstract: "Set a ZFS mountpoint manually and try again."
year: "2018"
category: Software
tag:
- bsd
- ezjail
- freebsd
- jails
- security
- written-in-sydney
---
I've been meaning to try `iocage` on FreeBSD, but Dirk Engling and the team have done such a good job with `ezjail`, I keep using it for everything. But I was reminded of an issue when using ezjail on standard zroot installs.

FreeBSD instances on OrionVM are installed into a zroot ZFS pool by default. I would know, I built them! You can live-attach a second disk and use that for your jails, but on a whim I decided to use my existing zroot. But in doing so, I had this come up:

    # zfs create zroot/jails
    # ezjail-admin install -r 12.0-RELEASE

    ==> base.txz             147 MB  844 kBps 02m58s
    ==> tar: could not chdir to '/usr/jails/fulljail'
    ==> Error: Package install script for base failed.

There are two solutions. The easiest is to create it where it's expected to find it by default:

    # zfs create zroot/usr/jails

Or create as normal, but set the mountpoint:

    # zfs create -o mountpoint=/usr/jails zroot/jails

And now new jail creates worked.

