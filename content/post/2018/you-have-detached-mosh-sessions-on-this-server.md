---
title: "You have detached Mosh sessions on this server"
date: "2018-10-23T16:26:09+11:00"
abstract: "Just kill their PID if you leave on by accident"
year: "2018"
category: Software
tag:
- freebsd
- linux
- mosh
- netbsd
- security
- ssh
- written-in-sydney
---
There's a ton of tech I take for granted but barely discuss. Mosh has received all but one blog mention here, but I use it daily. I consider it mandatory for administering FreeBSD, NetBSD, and Linux servers in remote availability zones.

Mosh sessions are specifically designed for fault tolerance. Unlike SSH, if you drop a connection, Mosh will continue to keep the session alive for you to reattach. No more *ah crap, did I run that session inside a screen?!* 

The side effect of this is you may encounter these when you re-connect to a server:

    Mosh: You have 2 detached Mosh sessions on this 
    server, with PIDs:
        - mosh [49443]
        - mosh [80599]

If you don't need them, just kill their process. Too easy:

    # kill 49443

This also unintentionally demonstrates FreeBSD PID randomisation; specifically increment randomisation. Linux doesn't support them, for better or worse depending on who you speak to. I concede they're no panacea, and random PIDs can introduce their own problems, but security is abouy layers. It's good FreeBSD affords us the option.

