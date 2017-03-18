---
draft: true
title: "Bandwidth Monitor Next-Generation"
date: "2017-02-27T14:36:00+10:00"
abstract: "There are lots of bandwidth monitoring tools, and bwm-ng is a nice one."
category: Software
tag:
- bsd
- debian
- freebsd
- linux
- netbsd
- networking
---
There are lots of bandwidth monitoring tools. bwm-ng is one of them, and its very nice. It supports Linux's proc, FreeBSD's sysctl, netstat, getifaddr and a few others.

    bwm-ng v0.6 (probing every 0.500s), press 'h' for help
    input: getifaddrs type: rate
    \         iface                   Rx                   Tx                Total
    ==============================================================================
                em0:           0.00 KB/s            0.00 KB/s            0.00 KB/s
                em1:           0.00 KB/s            0.00 KB/s            0.00 KB/s
                em2:           0.00 KB/s            0.00 KB/s            0.00 KB/s
                em3:           0.00 KB/s            0.00 KB/s            0.00 KB/s
               bge0:       36214.84 KB/s          953.12 KB/s        37167.97 KB/s
                lo0:           0.00 KB/s            0.00 KB/s            0.00 KB/s
            bridge0:           0.00 KB/s            0.00 KB/s            0.00 KB/s
    ------------------------------------------------------------------------------
              total:       36214.84 KB/s          953.12 KB/s        37167.97 KB/s

It's in [FreeBSD ports], [Pkgsrc], [Homebrew] and [Apt]. You're welcome.

[FreeBSD ports]:    https://www.freshports.org/net-mgmt/bwm-ng/
[Pkgsrc]:   http://pkgsrc.se/wip/bwm-ng
[Homebrew]: https://github.com/Homebrew/homebrew-core/blob/master/Formula/bwm-ng.rb
[Apt]:      https://packages.debian.org/search?searchon=names&keywords=bwm-ng

