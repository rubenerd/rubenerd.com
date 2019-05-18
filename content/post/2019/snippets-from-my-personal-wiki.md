---
title: "Snippets from my personal wiki"
date: "2019-05-09T18:05:07+10:00"
abstract: "Books, CloudFlare geoblocks, an abridged New York to-do list, and disk benchmarks."
year: "2019"
category: Thoughts
tag:
- benchmarks
- books
- cloudflare
- disks
- geoblocks
- nvalt
- personal-wiki
location: Sydney
---
I use flat text files as a basic personal wiki on my Mac, initially with Notational Velocity, then nvALT. If anyone who knows a good Vim plugin so I can do it on FreeBSD let me know! 

Over time this folder has accumulated 1,182 files, some of which haven't been touched for *years*. I thought it'd be fun to surface some of them. Here's a to-do list for books:

    - Chris Hadfield, An Astronaut's Guide to Life on Earth  
    - Tony Windsor, Windsor's Way

Here's what being geoblocked in Australia looks like:

    Error 1009 Ray ID: 3f27717c1dd265f3 • 2018-02-25 03:05:30 UTC
    Access denied
    What happened?
    The owner of this website has banned the country or region
    your IP address is in (AU) from accessing this website.

A strangely short to-do list from our [New York trip](https://rubenerd.com/live-from-new-york-city):

    x Midtown
	x Flatiron building
	- United Nations

And some benchmarks where I noted the CPU but not the disk drive, which seems odd:

    ## Running
    dd if=/dev/zero bs=1024k of=tstfile count=1024 && \
        purge && \
        dd if=tstfile bs=1024k of=/dev/null count=1024 && \
        rm tstfile
    ## Results 
    Intel Core2 Duo E8400 @ 3.00GHz 2177 
    Intel Celeron G1610T @ 2.30GHz 2336 
     
