---
draft: true
title: "Enforce 4k sectors in FreeBSD"
date: "2016-08-30T17:35:27+10:00"
year: "2016"
location: Sydney
category: Software
tag:
- bsd
- freebsd
---
FreeBSD defaults to 512k sectors, and there's no provision in ZFS on FreeBSD to change this. If you try the following that works on Solaris and ZFSonLinux, you'll be told the option doesn't exist:

    # echo "Does not work on FreeBSD"
    # zpool create - 

But you can use.

    # gnop create -S 4096 /dev/diskid/DISK-xxxxxxxxxxxxxx

1\. Create your zpool on these, then export.

    # zpool create [..] tank mirror \
        /dev/diskid/DISK-xxxxxxxxxxxxxx.nop \
        /dev/diskid/DISK-yyyyyyyyyyyyyy.nop
    # zpool export tank

2\. Delete the providers, then re-import the pool.

    # gnop destroy /dev/diskid/DISK-xxxxxxxxxxxxxx.nop \
    # gnop destroy /dev/diskid/DISK-yyyyyyyyyyyyyy.nop
    # zpool import tank

3\. Re-reference the disks



I like using the unique, static `/dev/diskid` values here, rather than arbitrary adaX. 


    ==> fdisk /dev/diskid/DISK-JK11C1YAJ6SYWV
    ==> [..]
    ==> Media sector size is 512
