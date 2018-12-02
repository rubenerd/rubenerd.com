---
title: "mkfs.xfs on Debian"
date: "2018-11-22T22:17:21+11:00"
abstract: "By default mkfs on Debian has extX and... Minix!"
year: "2018"
location: Sydney
category: Software
tag:
- ansible
- debian
- filesystems
- freebsd
- linux
- xfs
---
FreeBSD has `newfs` for baking UFS volumes, with a handy `newfs_msdos` shortcut for formatting FAT. `mkfs` has equivalent shortcuts on Linux for the file systems it supports, as shown by the following tab completion on Debian Stretch:

    # mkfs<TAB>  
    ==> mkfs      mkfs.cramfs  mkfs.ext3  mkfs.minix
    ==> mkfs.bfs  mkfs.ext2    mkfs.ext4

Minix, that's so cool! But what if we want `xfs`? 

    # apt-get install xfsprogs

Or for those who [really know] what they're doing:

    - name: "Install xfs tooling"
      apt:
        name: xfsprogs
        state: latest
        update_cache: yes

And now we can bake a new `xfs` volume:

    # whereis mkfs.xfs
    ==> /sbin/mkfs.xfs

[really know]: https://rubenerd.com/tag/ansible/

