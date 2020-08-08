---
title: "Finding file duplicates with fdupes on FreeBSD"
date: "2020-07-28T14:08:43+10:00"
abstract: "Yes I’m twenty years late, but someone’s born every minute who hasn’t seen The Flintstones"
year: "2020"
category: Software
tag:
- bsd
- freebsd
- tools
location: Sydney
---
Today I learned of the MIT-licenced [fdupes](https://github.com/adrianlopezroche/fdupes) by Adrian Lopez that performs hashed and byte-for-byte file comparisons and presents lists of duplicated files. It works well, and you should use it. A big shoutout to ehaupt@ for maintaining the [FreeBSD port](https://www.freshports.org/sysutils/fdupes/), and ef at Bonn University for maintaining on [pkgsrc](https://pkgsrc.se/sysutils/fdupes).

On my Mac I use the excellent open source [dupeGuru](https://dupeguru.voltaicideas.net/) GUI application, but I had a need to find duplicates across terabytes of data on one of my FreeBSD microservers over the weekend. I wanted a tool that I could easily run in a detached screen session, and fdupes fit the bill like a buff platypus. What?

I took a ZFS snapshot of my dataset in case things went pear-shaped and I needed to roll back, then set it to auto-delete duplicates in a my target directory. Substitute your pool, dataset, and directory as required:

    # zfs snapshot pool/tank@backup
    $ echo "THIS WILL DELETE DATA"
    $ fdupes -r -d -N $directory

If you just want it to identify duplicates:

    $ fdupes -r $directory > dupes.log

Or if you want it to prompt you as it finds them:

    $ fdupes -r -d $directory

Someone will probably tell me that ZFS has deduping, but it's not applicable in this case. This was just a quick and dirty job to clean up some recursively rsync'd mess that I did while half-asleep; and I just use lz4 compression for all my pools now anyway.

I could have cleaned it myself, but why not let The Machine&trade; do it?

