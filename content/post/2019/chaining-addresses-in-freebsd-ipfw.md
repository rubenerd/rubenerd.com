---
title: "Chaining addresses in FreeBSD ipfw"
date: "2019-11-18T17:23:38+11:00"
abstract: "You can use blocks delineated with curly or round brackets."
year: "2019"
category: Software
tag:
- bsd
- firewalls
- freebsd
location: Sydney
---
Between bhyvecon Tokyo talks last year I overheard some of the guard discussing how ipfw offered higher equivalent throughput than pf on FreeBSD. There may have been a caveat or part of the discussion I missed, but I took this as an excuse and opportunity to finally learn it.

Today I was trying to figure out how to only enable a port for a specific set of IP addresses. The easiest way is to specify two rules in your `ipfw.rules`:

    ipfw -q add 00500 allow tcp from x.x.x.x to me 43210 in via $WAN
    ipfw -q add 00501 allow tcp from x.x.x.y to me 43210 in via $WAN

But rules can also contain multiple addresses. From the `manpage(8)`:

> Additionally, sets of alternative match patterns (or-blocks) can be constructed by putting the patterns in lists enclosed between parentheses ( ) or braces { }, and using the or operator.

So the alternative for my above could be this:

    TRUSTED="x.x.x.x or x.x.x.y"
    ipfw -q add 00500 allow tcp from \{ $TRUSTED \} to me 43210 in via $WAN

Sure enough, when you `ipfw list`:

    ==> 00500 allow tcp from { x.x.x.x or x.x.x.y } to me 43210 in via $WAN

Aside from being easier to read and update, it also means you avoid needing to iterate a rule number in your scripts.

*(Funny story, I blogged about OpenBSD's ported pf on FreeBSD years ago, and the visceral comments from certain Linux folks were severe enough that I deleted it and self-censored BSD posts. Two months later, and I'd even turned off blog comments. I feel a mix of trepidation and cautious optimism posting about firewalls on the BSDs again).*

