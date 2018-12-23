---
draft: true
title: "Could not chdir to fulljail"
date: "2018-12-22T13:15:42+11:00"
abstract: "Set a ZFS mountpoint manually and try again."
thumb: ""
year: "2018"
location: Sydney
category: Software
tag:
- bsd
- ezjail
- freebsd
- jails
- security
---
I've been meaning to try `iocage` on FreeBSD, but Dirk Engling and the team have done such a good job with `ezjail`, I keep using it for everything. But I was reminded of.

FreeBSD instances on OrionVM are installed into a zroot ZFS pool by default. I would know, I built them! You can live-attach a second disk and use that for your jails, but on a whim I decided to use my existing zroot. In my 

    ezjail_use_zfs="YES"
    ezjail_use_zfs_for_jails="YES"
    ezjail_jailzfs="zroot/jails" 

But in doing so, I had this come up:

    # zfs create zulu/jails
    # ezjail-admin install -r 12.0-RELEASE

    ==> base.txz             147 MB  844 kBps 02m58s
    ==> tar: could not chdir to '/usr/jails/fulljail'
    ==> Error: Package install script for base failed.

`fulljail` is what ezjail creates other jails on. That sentence had a lot of jail. 

The easist solution

I confirmed I had only the standard ezjail.conf ZFS options enabled, and my ezjail_jailzfs option pointed to the correct pool:


But sure enough, the fulljail folder didn't exist:

    $ ls /usr/jails
    $ ==> *crickets*

So I set a manual ZFS mountpoint for that new pool:

    # zfs set mountpoint=/usr/jails zulu/jails

And new jail creates worked.

