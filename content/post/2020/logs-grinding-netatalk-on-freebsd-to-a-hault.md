---
title: "Logs grinding Netatalk on FreeBSD to a hault"
date: "2020-05-08T07:53:14+10:00"
abstract: "Cleared the logs, everything returned to normal."
year: "2020"
category: Software
tag:
- samba
- afp
- netatalk
location: Sydney
---
I've heard it said the cobbler's children walk barefoot. While posessing the qualities of a [famed](https://barefootinvestor.com/) financial investment strategy, it speaks to how we generally put more effort into things for others than ourselves; at least in business.

<p><img src="https://rubenerd.com/files/2019/fleet-companioncube@1x.jpg" srcset="https://rubenerd.com/files/2019/fleet-companioncube@1x.jpg 1x, https://rubenerd.com/files/2019/fleet-companioncube@2x.jpg 2x" alt="" style="width:128px; float:right; margin:0 0 1em 2em;" /></p>

The [HP Microserver](https://rubenerd.com/omake/the-fleet/#kyou--the-hp-microserver-gen8-bhyve-box) I share with Clara is a modest affair compared to what we run at work. It has six spinning rust drives and two SSDs which are ZFS-mirrored; not even in a RAID 10 equivalent. This is underlaid with GELI for encryption, and served to our Macs with Netatalk over gigabit Ethernet with jumbo frames.

I tried switching to Samba once, but [Netatalk](http://netatalk.sourceforge.net/) is marginally faster for what we do, and is way more compatible with the software we use, even with the [recent additions](https://support.apple.com/en-us/HT207128) to [Samba 4](https://www.linux-magazine.com/Online/Features/What-s-New-in-Samba-4) and the fact [AFS is depracated](https://www.afp548.com/2013/06/11/smb2-and-you-saying-goodbye-to-afp-in-os-x-mavericks/). I also run NFS to serve my FreeBSD [Panasonic laptop](https://rubenerd.com/omake/the-fleet/#lum-the-panasonic-cf-rz6-lets-note), because they basically only need to backup text. But I digress.

So imagine my surprise and irritation when our AFP shares suddenly went to absolute crap last night. The Mac Finder struggles to list directories on NASs at the best of times, but I could barely load anything. Worse, the Finder would hang when loading folders with more than a dozen items, which required a `killall` on the client side. I do still like macOS after all these years, but the fact a *network share* can bring down everything else with it reminds me of the dark days before process isolation.

This sudden drop in performance has only happened for me in the home environment a handful of times, but was usually an immediate sign one of the drives in a ZFS array was about to *kark it*. But a `zpool status` returned optimal for the pool in question:

     state: ONLINE
      scan: scrub repaired 0 in 1 days 02:26:01 with 0 errors on...
    config:
    
    	NAME              STATE     READ WRITE CKSUM
    	zroot             ONLINE       0     0     0
    	  mirror-0        ONLINE       0     0     0
    	    gpt/ssd0.eli  ONLINE       0     0     0
    	    gpt/ssd1.eli  ONLINE       0     0     0

Yes I'm running these SSDs over the USB3 headers. Yes I know that's bad, and that I should feel bad. Cobblers aside, they also say necessity is the mother of invention.

So my next check was logs. And the issue became orders of magnitude clearer:

    # ls alh /var/log
    ==> -rw-r--r-- 1 root wheel 500G May 7 22:00 afpd.log

*Alamak!* I suppose this is a credit and testament to the performance of ZFS's inline lz4 compression: this is a *120 GiB boot SSD*, and it'd been written to continuously. I wonder how much I shortened the lifespan of these devices?

I cleared the log, and the performance immediately returned. Next step is to figure out how that log got so massive in the first place, and set a quota for the log dataset.

