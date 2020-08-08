---
title: "More FreeBSD HPE Microserver homelab answers"
date: "2020-06-23T14:12:30+10:00"
abstract: "Celeron CPUs, hardware mods, Linux alongside BSD, hostnames, and NICs."
thumb: "https://rubenerd.com/files/2020/yt-3dSnOEKTWQM@1x.jpg"
year: "2020"
category: Hardware
tag:
- bsd
- freebsd
- infiniband
- netbsd
- networking
- microservers
location: Sydney
---
My [homelab post](https://rubenerd.com/booting-freebsd-off-the-microserver-odd-sata-port/) generated a ton of questions and comments, most of them specific to running FreeBSD on a Gen8 HPE Microserver. I answered a question about how to [boot off the optical drive SATA port](https://rubenerd.com/booting-freebsd-off-the-microserver-odd-sata-port/), then promptly forgot to answer any more!

This post will be a grab-bag summary of some other questions that were asked a few times. 


### Is the budget spec'd G8 Microserver with a Celeron any good?

Short answer, yes. Here's the specs of my lowest-end unit:

    $ sysctl hw.model hw.ncpu
    hw.model: Intel(R) Celeron(R) CPU G1610T @ 2.30GHz
    hw.ncpu: 2

This may not seem like much, but it's still a server board with ECC memory for your ZFS arrays, which I care about more than performance. It even has enough power for serving multiple file shares while transcoding PleX to our Apple TV at 1080p, and all under 35W TDP so the fans stay nice and quiet.

The only two things I don't like about this CPU: no AES-NI offloading, and while it has VT-x, it doesn't have VT-d. The former surprised me given how easily it delivers data off GELI-encrypted drives to our Macs with netatalk, but I suppose that shows the bottleneck there isn't the crypto.

My other Microserver uses an old 4-core Xeon E31260L which has all the above features and lets me thinker with hypervisors. It also only hits 45W, so the fans don't take off late at night while we're trying to sleep.


### Have you made any modifications to the hardware?

Save for running an SSD in the optical drive bay and adding a few more DIMMs, not really. The previous owner of my Xeon Microserver upgraded the CPU from its original Celeron. 

The one other minor change was the addition of a passive heatsync on the Broadcom NIC chips as [John Stutsman described](https://www.youtube.com/watch?v=3dSnOEKTWQM). In Sydney summers and Singapore all year round, this one chip regularly exceeded 70°C which didn't measurably impact performance, but still had me worried. I should do a proper post about this one day.

<p><a target="_blank" href="https://www.youtube.com/watch?v=3dSnOEKTWQM" title="Play Cooling the Broadcom Chip at Location 13-LOM on my Gen8 MicroServer"><img src="https://rubenerd.com/files/2020/yt-3dSnOEKTWQM@1x.jpg" srcset="https://rubenerd.com/files/2020/yt-3dSnOEKTWQM@1x.jpg 1x, https://rubenerd.com/files/2020/yt-3dSnOEKTWQM@2x.jpg 2x" alt="Play Cooling the Broadcom Chip at Location 13-LOM on my Gen8 MicroServer" style="width:500px;height:281px;" /></a></p>


### What Linux distros have you used on it?

At work we use Debian with Xen, so I ran it on my Xeon Microserver too with OpenZFS and btrfs for testing, the former of which worked fine and the latter isn't the fault of the hardware! I still do use Debian on one now, albeit as a bhyve guest.

While I'm talking about OSs, they've also run Oracle Solaris 11, VMware ESXi, and Windows Server 2012 R2. One day I intend to try OpenBSD as well.


### Where did your hostnames come from? 

Naming schemes are an incredibly important and detailed topic for which a dedicated post is warranted and forthcoming. For my Microservers, `mio.lan` is named for Akiyama Mio, the timid bassist from the *K-On!* franchise. And `aino.lan` was named for Minako Aino from *Sailor Moon*. They weren't my favourite characters from their respective shows, but they played important supporting roles... like servers do.

As an aside, it's it amazing how anime art has changed over the years. And *K-On!* is already almost a decade old itself, which makes me feel incredibly old.

<p><img src="https://rubenerd.com/files/2020/hostnames-microservers@1x.jpg" srcset="https://rubenerd.com/files/2020/hostnames-microservers@1x.jpg 1x, https://rubenerd.com/files/2020/hostnames-microservers@2x.jpg 2x" alt="" style="width:500px" /></p>


### What NICs does it have?

Mine have older Mellanox MT26428 QDR InfiniBand cards, after we upgraded hardware at work. But the two built-in NICs are Broadcom NetXtreme Gigabit Ethernet that Bill Paul's excellent [bge(4)](https://www.freebsd.org/cgi/man.cgi?query=bge&sektion=4) drivers support out of the box on FreeBSD.

In a past life one of the servers also ran a 4-port Intel Gigabit PCIe card when I was using it as a glorified router and VPN end-point with some storage attached. I thought I had a `dmesg` saved, but I can't remember.

I still owe people some answers about what my GELI and ZFS pool layouts look like, and how iLO works, but that's it for now. Feel free to ping me at [@Rubenerd](https://twitter.com/Rubenerd) on Twitter or my [email](https://rubenerd.com/about/) if you need more info. 
