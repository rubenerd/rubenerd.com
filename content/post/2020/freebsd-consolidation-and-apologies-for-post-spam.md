---
title: "FreeBSD consolidation, and spam apologies"
date: "2020-03-31T22:18:33+11:00"
abstract: "Everything is on 12.1-RELEASE now, but it didn’t stop me accidently posting a torrent of new entries by mistake!"
year: "2020"
category: Internet
tag:
- bsd
- databases
- freebsd
- mariadb
- mysql
- postgresql
- weblog
location: Sydney
---
I spent part of the weekend consolidating a ton of my disparate cloud servers running a hodgepodge of FreeBSD 11.x, NetBSD 7.x, Debian Jessie, and CentOS 6.x. One of the benefits of working for an IaaS company is getting all this for free, but ongoing maintenance and technical debt was starting to rear its poorly-constructed head.

I now have a few beefier FreeBSD 12.1 cloud servers handling all of Clara's and my stuff with some jails. I also took the opportunity to finally standardise on Postgres for everything that needs a database, and replacing applications that only work with MySQL and its offshoots. Again, maintaining separate MariaDB and Postgres stacks with warm replication for personal and family stuff was just silly. Maybe if I didn't care abut backups or redundancy I could have just run two small servers on the same box, but I didn't.

There's nothing especially noteworthy or custom about the stack, it's off-the-shelf and rote. But I'll post some of the details if I encounter any tidbits.

Naturally I didn't get all finished before the work week, so I'm still ironing out a few kinks. My auto-posting has been broken since Sunday, so apologies for the manual push and subsequent spam to your RSS readers and Twitter feeds. Many of you have also pointed out other broken things for me to fix for which I am grateful :).

