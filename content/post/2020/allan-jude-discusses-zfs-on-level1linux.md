---
title: "Allan Jude discusses ZFS on Level1Linux"
date: "2020-08-04T08:34:28+10:00"
abstract: "My favourite point that often gets ignored in FS discussions: ZFS is actually nice to use."
thumb: "https://rubenerd.com/files/2020/yt-SJB1cJfcjYI@1x.jpg"
year: "2020"
category: Software
tag:
- bsd
- freebsd
- openzfs
- zfs
location: Sydney
---
I only just [came across this video](https://www.youtube.com/watch?v=SJB1cJfcjYI "Allan Jude Interview with Wendell - ZFS Talk & More") from April 2017, but it's been a pleasure listening to these two gents discuss these topics near and dear to my heart while I have my morning coffee.

<p><a href="https://www.youtube.com/watch?v=SJB1cJfcjYI" title="Play Allan Jude Interview with Wendell - ZFS Talk & More"><img src="https://rubenerd.com/files/2020/yt-SJB1cJfcjYI@1x.jpg" srcset="https://rubenerd.com/files/2020/yt-SJB1cJfcjYI@1x.jpg 1x, https://rubenerd.com/files/2020/yt-SJB1cJfcjYI@2x.jpg 2x" alt="Play Allan Jude Interview with Wendell - ZFS Talk & More" style="width:500px;height:281px;" /></a></p>

I've made the point that ZFS's integrity checks and copy-on-write characterises are why it's the only file system I trust, but Allan really drives home the other key point that I think is often lost in the debates: ZFS is a *pleasure to use*.

> What set ZFS apart: when they were building it for Solaris&mdash;unlike a lot of other file systems where they're written by developers, for developers&mdash;the point of ZFS was to make storage admin *easy*. They wanted adding more storage to your server to be just as easy as adding more RAM.

If you have more experience with Linux, Allan also helpfully touches on how it compares to tools you may familiar with, like LVM and btrfs. He also discusses optimisation, dtrace, FreeBSD, TRIM on SSDs, and most maddeningly of all, continues to flaunt his awesome tetris light.

