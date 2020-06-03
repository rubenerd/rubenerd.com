---
title: "Quick FreeBSD bridge when your switch is full"
date: "2020-05-27T09:16:06+10:00"
abstract: "Simple and works, until I get a bigger switch!"
year: "2020"
category: Software
tag:
- bsd
- freebsd
- netbsd
- networking
location: Sydney
---
<p><img src="https://rubenerd.com/files/2020/homelab@1x.jpg" srcset="https://rubenerd.com/files/2020/homelab@1x.jpg 1x, https://rubenerd.com/files/2020/homelab@2x.jpg 2x" alt="" style="width:500px" /></p>

*(This has turned into an unintentional week of NetBSD posts, which given the rude detractors on Twitter earlier this week I quite like. With hindsight maybe I should have served the bridge from the other machine to learn how to do it on NetBSD for the first time!)*

What do you do when you've run out of Ethernet ports on your tiny homelab switch? Bridge the second Ethernet port on your Microserver and connect it to the first port on your second one. Five minute job, and it just works.

`/etc/rc.conf` on the FreeBSD Microserver:

    ifconfig_bge0="inet <IP already configured> netmask <netmask>"
    cloned_interfaces="bridge0"
    ifconfig_bridge0="addm bge0 addm bge1 up"
    ifconfig_bge1="up"

And yay! `ifconfig` on the NetBSD Microserver:

    bge0: ...
        media: Ethernet autoselect (1000baseT full-duplex,master)
        status: active

I've been researching 2.5/5GBASE-T so have been reluctant to buy a new Gigabit switch with more ports. But I doubt I could afford a 10G switch right now anyway. Either way, this works in the meantime.

I should probably upgrade the FreeBSD Microserver to 13-CURRENT to try out Kristof Provost's [performance improvements](https://www.freebsdfoundation.org/blog/500-if_bridge-performance-improvement/).

