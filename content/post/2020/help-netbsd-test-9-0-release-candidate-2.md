---
title: "Help NetBSD test 9.0 Release Candidate 2"
date: "2020-02-03T14:54:10+11:00"
abstract: "ZFS support alone is exciting, but there’s so much in this release."
thumb: "https://rubenerd.com/files/2020/netbsd@2x.png"
year: "2020"
category: Software
tag:
- bsd
- netbsd
- zfs
location: Sydney
---
I tweeted about this earlier today, but this is huge news. If you have a spare moment, please [download and run](https://www.netbsd.org/releases/formal-9/NetBSD-9.0.html) the latest release candidate for NetBSD 9.0 for an architecture you can test on.

<p><img src="https://rubenerd.com/files/2020/netbsd@1x.png" srcset="https://rubenerd.com/files/2020/netbsd@1x.png 1x, https://rubenerd.com/files/2020/netbsd@2x.png 2x" alt="" style="width:128px; height:98px; float:right; margin:0 0 2em 2em" /></p>

NetBSD 9.0 looks to be a stellar release, particularly for storage for which I harbour the most interest. ZFS pools can't yet be booted from, but will be finally included for data use which I'm super keen to test. They've also reworked the SATA stack in the same vain to better handle reported drive errors.

There are tons of other features and changes; check the [formal release notes](https://www.netbsd.org/releases/formal-9/NetBSD-9.0.html) for more details and grab an ISO or disk image.

I'm mostly a FreeBSD person now, but NetBSD was my first, and I still [maintain a few computers](https://rubenerd.com/what-a-freebsd-guy-uses-netbsd-for/) and a template for it on OrionVM. I was also lucky enough to meet several of the maintainers at AsiaBSDCon who also explained to me how <code><a href="https://netbsd.gw.com/cgi-bin/man-cgi?devpubd+8">devpubd(8)</a></code> worked for my platform integration scripts. And pkgsrc is the best cross-platform package manager, as far as I'm concerned.

