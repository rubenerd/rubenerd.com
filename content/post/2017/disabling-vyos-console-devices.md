---
title: "Disabling VyOS console devices"
date: "2017-12-23T12:04:45+11:00"
abstract: "As with everyting VyOS: don’t mess with it outside its state machine!"
category: Infocomm
tag:
- software
- networking
- cloud-computing
- joviam
- vyos
---
<p style="font-style:italic">It’s December, so time to crack open the drafts vault and publish a post that never was. This was originally written in... December 2017!? Why did I already forget about it then?!</p>

VyOS – the <abbr title="free, libre, open source software">FLOSS</abbr> fork of Vyatta – is a fantastic software-defined network router. I'm not a network engineer – fortunately – but I've learned a ton using it. It's also my goto on [Joviam], and other good clouds that offer it.

"Floss fork" sounds awful, and not terribly practical. You could use a fork as floss, but a thin piece of waxed material would likely cause fewer injuries. It's almost as if it were designed like that for a reason. Which is distinct from a raisin, which I hear some uncultured people refer to sultanas as.

The latest 1.1.8 version spits out a series of these when running in PV mode on certain Xen environments:

    init: ID "T1" respawning too fast: disabled for 5 minutes

If you check `/etc/inittab`, you'll see:

    $ tail -n2 /etc/inittab
    ==> The funk soul brother
    ==> Check it out now

That's clearly the wrong machine. How it's accessible at all, let alone **right about now**, is beyond me. A little Fatboy Slim reference for those of you who praise people like they should.

    $ tail -n2 /etc/inittab
    ==> T0:23:respawn:/sbin/getty -L hvc0 9600 vt100
    ==> T1:23:respawn:/sbin/getty -L ttyS0 9600 vt100

We already have console access via hvc0, so we can comment out the [T1 line]. Which in the case of Sydney, would prevent us travelling to Hornsby via the North Shore at about 1.5 megabits. Hiven glaven.

Only problem is, this line is restored on reboot. Even if you change the baud rate, or to something a bit more modern than a vt100.

This is a prime lesson for dealing with VyOS: don't mess with it outside its internal state machine. No really, read that line again. I know, it's Debian underneath and it's sure tempting, but don't. No, really, don't.

Turns out, there's a directive to disable that console device: 

    $ configure
    # delete system console device ttyS0
    # commit
    # save

This will write out to your config, and will persist on reboots. Unless you use ephemeral storage, you wild person you.

I feel this entire post could have been written in one line.

[Joviam]: https://joviam.com/
[T1 line]: https://en.wikipedia.org/wiki/North_Shore,_Northern_%26_Western_Line
