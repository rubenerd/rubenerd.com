---
title: "You lock your data with us, we cannot fail"
date: "2020-08-27T09:11:12+10:00"
abstract: "Michael Dexter and Bruce Momjian on trust and durability."
year: "2020"
category: Software
tag:
- asiabsdcon
- bsd
- freebsd
- databases
- postgres
- zfs
location: Sydney
---
One of the most important things I've heard in the last few years was Michael Dexter's comment about OpenZFS at AsiaBSDCon 2019. I've paraphrased it here a few times:

> Once we lose data *once*, on *any* platform, people won't trust us again.

Bruce Momjian also [wrote about this](https://momjian.us/main/blogs/pgblog/2012.html#December_14_2012_2 "Why database software is unique") in the context of databases last week, emphasis added:

> Having worked with databases for over three decades, I have found there are three aspects of database software that make it unique: Variable workloads, performance requirements, and **durability**.
>
> Most other software do not have these requirements. Because of them, databases typically need more tuning, monitoring, and maintenance than other software, like Java applications or even operating systems.

He linked to an article he wrote in 2012: *[You Lock Your Data in Postgres — We Cannot Fail](https://momjian.us/main/blogs/pgblog/2012.html#December_14_2012_2)*. It's a good read, and also introduces the responsibility of supplying reliable hardware. But the stakes are still fantastically high to get this right on the software side, and to tolerate the real world conditions in which it's expected to work.

I'd trust Postgres over other DBs for mission critical work in a similar vein to what Michael and Bruce raise above: it's proven itself durable and trustworthy. Trust is hard to earn, and easy to lose.

