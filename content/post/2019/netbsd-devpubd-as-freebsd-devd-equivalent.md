---
title: "NetBSD devpubd as a FreeBSD devd equivalent"
date: "2019-03-07T08:47:36+11:00"
abstract: "As per advice from an old mailing list thread, looks like it could work."
year: "2019"
category: Software
tag:
- bsd
- file-systems
- freebsd
- hard-drives
- netbsd
- ssds
location: Sydney
---
<p><img src="https://rubenerd.com/files/2019/screenie2008-maihime-netbsd@1x.jpg" srcset="https://rubenerd.com/files/2019/screenie2008-maihime-netbsd@1x.jpg 1x, https://rubenerd.com/files/2019/screenie2008-maihime-netbsd@2x.jpg 2x" alt="" style="width:500px; height:312px;" /></p>

I was looking for a NetBSD equivilent to `devd` on FreeBSD to react to disk changes. At work we inject configuration into virtual machines using a separate disk, which can be live ejected and attached.

This [mailing list] post by Martin Husemann entry from 2012 suggests I should check out `devpubd`. From the `man(8)` page:

> **devpubd** - device publish daemon for automatic device node creation ... devpubd listens on `drvctl(4)` for new devices and creates their device nodes using `MAKEDEV(8)`

Unless anyone can think of something else I should try, I'll check this out. Also, that desktop background [took me back].

[mailing list]: https://mail-index.netbsd.org/tech-kern/2012/11/12/msg014383.html
[took me back]: https://rubenerd.com/p2764/

