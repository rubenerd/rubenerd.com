---
title: "rar files in Debian Jessie"
date: "2016-04-23T11:38:00+10:00"
year: "2016"
category: Software
tag:
- compression
- debian
- guides
- rar
location: sydney
---
People keep sending me rar files like its 1999. 7zip is free, open source, and has higher compression ratios: please use it!

So I tried installing on Debian Jessie:

    $ sudo apt-get install unrar

    ==> Reading package lists... Done
    ==> Building dependency tree
    ==> Reading state information... Done
    ==> Package unrar is not available, but is referred to by another package.
    ==> This may mean that the package is missing, has been obsoleted, or
    ==> is only available from another source

    ==> E: Package 'unrar' has no installation candidate

This had always worked before, weird. One thing you can never accuse open source people of is consistency. Fortunately:

    $ sudo apt-get install unrar-free

I have it on good authority this will soon be replaced by a nine word systemd command, as part of their archived framework.

