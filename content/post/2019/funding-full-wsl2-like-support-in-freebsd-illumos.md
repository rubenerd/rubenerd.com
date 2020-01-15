---
title: "Funding bhyve VirtFS/9p completion project"
date: "2019-12-02T21:50:27+11:00"
abstract: "The first $1500 USD in sponsorships will be matched by an anonymous donor!"
thumb: ""
year: "2019"
category: Thoughts
tag:
- bsd
- freebsd
- illumus
- virtualisation
location: Sydney
---
Via [Michael Dexter on Twitter](https://twitter.com/michaeldexter/status/1201392669483622400):

> Make #bhyveVirtFS/9p a thing today at bsdfund.org! The first $1500 in sponsorships are MATCHED by an awesome company that is using bhyve 9pfs in PRODUCTION. They're motivated. We're motivated. Let's do this!

And from [BSDfund.org](https://bsdfund.org/):

> This project will complete the current bhyve VirtFS/9p work with a roadmap for feature competitiveness with QEMU/KVM and Windows WSL2.

I remember getting excited about this back in late 2016 when I saw [this newsgroup message](http://freebsd.1045724.x6.nabble.com/VirtFS-support-in-bhyve-td6072678.html) by Jakub Wojciech Klama from earlier that year. If we could have this in bhyve, I would be *unreasonably* happy.

For those unfamiliar, at a high level VirtFS allows you to pass through folders directly into virtual machines from a host, rather than dealing with generic NFS or Samba/CIFS. [This paper](https://www.kernel.org/doc/ols/2010/ols2010-pages-109-120.pdf) by members of IBM's Linux Technology Centre goes into great detail explaining the motivation behind the system, and its implementation. I'll try and blog more about it.

