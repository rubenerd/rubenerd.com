---
title: "BSD Now discusses my encrypted ZFS on NetBSD post"
date: "2020-06-30T08:59:12+10:00"
abstract: "And Allan Jude answers my question about cross-BSD send/receive for ZFS."
thumb: "https://rubenerd.com/files/2020/bsdnow.jpg"
year: "2020"
category: Software
tags:
- allan-jude
- benedict-reuschling
- bsd
- netbsd
- openzfs
- podcasts
- zfs
location: Sydney
---
I was wondering why traffic to my server had spiked in the last few days: Allan Jude and Benedict Reuschling discussed my [encrypted ZFS on NetBSD post](https://rubenerd.com/encrypted-zfs-on-netbsd-9-for-a-freebsd-guy/) on their [latest episode](https://www.bsdnow.tv/356) of the [BSD Now](https://www.bsdnow.tv/) podcast! I've had the privilege of meeting both of them in person a few times now, and they're as knowledgable and friendly as you'd expect when listening to their show.

Back in May I tested NetBSD 9's disk encryption for the first time, and used it to create an encrypted ZFS pool. I asked at the end without:

> The next steps will be to research if I can (or should!) do ZFS send/receive with my FreeBSD ZFS boxes...

Allan Jude responded:

<p><a title="Tune into episode 356: Dig in Deeper" href="https://www.bsdnow.tv/356"><img src="https://rubenerd.com/files/2020/bsdnow.jpg" alt="The BSD Now logo" style="width:128px; height:128px; float:right; margin:0 0 1em 2em;" /></a></p>

> The answer is... yes!
> 
> ZFS replication is designed to be fully forwards and backwards compatible, so even if you are sending from the very newest FreeBSD, a ZFS send&mdash;provided you don't enable any extra features with extra flags&mdash;will be fully receivable on an old FreeBSD 8 machine, or an image you create on that FreeBSD 8 machine will be receivable on your FreeBSD 13 machine. Part of the point of ZFS send/receive is to enable this transition.
> 
> Now when you do a send/receive, that's why you have to specify some extra flags if you want to enable newer features, like lowercase "c" to enable compression, so those compressed blocks will stay compressed during send/receive. That presupposes that the other side is going to understand that.
> 
> Since ZFS replication is a unidirectional protocol, we don't ever talk to the other side about what features it supports, so it depends on you doing that, or having a script to do it for you.
>
> Also, if you use hostnames to transfer, make sure they're named for Star Trek ships and not anime characters or you'll lose throughput in the secondary InfiniBand plasma manifold.

Thanks! And for the interests of transparency, one of those transcribed sentences was fake.

