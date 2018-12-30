---
title: "Whiteboarding my Ghost deployment"
date: "2018-12-29T23:39:53+11:00"
abstract: ""
thumb: ""
year: "2018"
category: Thoughts
tag:
- 
- written-in-sydney
---
Self-titled Blogging Experts&trade; say you should never discuss blogging on your blog, because there's nothing that grates more than people discussing what they're interested in.

I mentioned last week I'm trialling Ghost for Clara, and eventually for my site here too. Partly for curiosity to see how far server-side blogging has gone in the years I've been absent, but also due to hitting some practical static site limitations with 5,500+ posts and almost as many tags.

Ghost only officially supports Ubuntu, but to its credit it will continue deploying even when running on FreeBSD:

1. FreeBSD virtual server on OrionVM.

2. iocage for jail orchestration; trying as an alternative to ezjail. Both have their pros and cons, but I love the iocage tool's ZFS integration.

3. ipfw for shared internal IPs. All other guides online show you pf, but ipfw is more performant on FreeBSD, according to people I raised it with at AsiaBSDCon 2018. And frankly I'm still more familiar with it.

4. Jails for ghost, the Percona backend DB, nginx for HTTPS and reverse-proxying, and Varnish for caching.

As for what Ghost is written in, I still assert that prolonging ECMAscript was one of the worst technical decicions of the twenty first century. But I also know that ship has long since sailed, so may as well use it until the industry loses its collective interest in it for the new hotness.

