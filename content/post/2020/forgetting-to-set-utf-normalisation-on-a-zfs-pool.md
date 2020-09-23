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

Normalisation is a field of information science that fills entire textbooks, but in a nutshell ZFS uses it, among other reasons, to reconcile filenames. How the filename is represented internally, and presented to the operator, can vary in unexpected ways, even if superficially they look the same.

Unfortunately, normalisation can't be set after the filesystem is created. *(Update: read below).* So this weekend I dropped one of the drives from my mirror, created a new pool with normalisation to transfer data back to, then resilvered the mirror back to full redundancy:

    # zpool -O normalization=formD [...]

Now previously-inaccessible files can be opened.

### Update

Henrik Winther kindly emailed in to advise that normalisation is a dataset level property, so you only need to create a new dataset to set it, thereby negating the need to reduce pool redundancy in the interim. He gave an example:

    # sudo zfs create -o normalization=formC gamma/test-normalization
    # /sbin/zfs get normalization | grep -E 'gamma |test'
    ==> gamma                    normalization none  -
    ==> gamma/test-normalization normalization formC -

I appreciate the feedback, especially if you're reading this post with the same issue I was having. **Just use a new dataset and you'll be fine.**

In production I would certainly use this approach. At home for personal data, and where I have backups, I prefer to set normalisation at the pool level so every dataset inherits it. All Clara's and my data have some form of CJK characters, so it makes things easier.

