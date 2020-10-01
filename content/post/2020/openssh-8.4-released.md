---
title: "OpenSSH 8.4 released"
date: "2020-09-29T08:48:18+10:00"
abstract: "Some great additions in this release, including a long-awaited -A flag for usability."
year: "2020"
category: Software
tag:
- bsd
- openbsd
- openssh
- security
location: Sydney
---
[OpenSSH 8.4](https://www.openssh.com/txt/release-8.4) was released yesterday. It includes several signifigant changes for FIDO/U2F authentication, some of which are listed as potentially-incompatible, but are still great to see. Other things that caught my eye:

> `scp(1)`, `sftp(1)`: allow the `-A` flag to explicitly enable agent
   forwarding in scp and sftp. The default remains to not forward an
   agent, even when ssh_config enables it.
> 
> `sshd(8)`: allow `sshd_config` longer than 256k

And I'm always pleased to see NetBSD portability notes:

> `sshd(8)`: support NetBSD's `utmpx.ut_ss` address field. bz#960

This exquisitely-maintained software powers so much of the Internet. It got me thinking that for all my talk about donations, I should put my money where my mouth is and [donate to the OpenBSD Foundation](https://www.openbsdfoundation.org/donations.html). Even if you've never heard of OpenSSH, you've also benefited from it.

