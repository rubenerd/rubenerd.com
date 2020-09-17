---
title: "Forgetting to set UTF normalisation on a ZFS pool"
date: "2020-09-13T10:40:56+10:00"
abstract: "Unfortunately it can’t be changed after creating the pool, so lesson learned!"
year: "2020"
category: Software
tag:
- bsd
- freebsd
- netbsd
- openzfs
- zfs
location: Sydney
---
Clara and I were getting some bizarre behavior while accessing a new FreeBSD pool over Netatalk and Samba. A subset of files with [CJK names](http://www.linfo.org/cjkv.html "Chinese, Japanese and Korean: A Brief Introduction") were showing up in the macOS Finder as expected, but would error out with *file not found* if you tried to open them. 

We store a lot of files in Japanese and Korean, especially music and holiday photo directories with place names, so I've always been careful about using UTF-8 globally. I confirmed I had this in my `/etc/login.conf`:

    default:\
    [...]
    :charset=UTF-8:\
    :lang=en_US.UTF-8:

*(NOTE: I've read this isn't advisable because it can break ports that weren't designed for UTF-8. I've never had that issue, but it's something to keep in mind. I'd also be worried if software in 2020 still had that limitation, but that's a topic for another post).*

Then I confirmed the ZFS pool was set up for UTF-8:

    # zfs get utf8only pool
    ==> NAME  PROPERTY  VALUE  SOURCE
    ==> zten  utf8only  on     -

So what was going on?

    # zfs get normalization pool
    ==> NAME  PROPERTY       VALUE  SOURCE
    ==> zten  normalization  none   -

Whoops!

Normalisation is a field of information science that fills entire textbooks, but in a nutshell ZFS uses it to reconcile filenames. This is especially important in UTF-8 where characters from disparate languages may appear superficially the same, such as Chinese-derived kanji in Japanese. How the filename is represented internally, and presented to the operator, can vary in unexpected ways.

Unfortunately, normalisation can't be set after the filesystem is created. So this weekend I dropped one of the drives from my mirror, created a new pool with normalisation to transfer data back to, then resilvered the mirror back to full redundancy:

    # zpool -O normalization=formD [...]

Now previously-inaccessible files can be opened.

