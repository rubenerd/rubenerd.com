---
title: "Obsolete best IT practices"
date: "2018-10-16T08:17:29+11:00"
abstract: "Use a padlock on your Zip disk box, damn it!"
year: "2018"
category: Hardware
tag:
- iomega
- networking
- nostalgia 
location: sydney
---
<p><img src="https://rubenerd.com/files/2018/scsi-chain@1x.png" srcset="https://rubenerd.com/files/2018/scsi-chain@1x.png 1x, https://rubenerd.com/files/2018/scsi-chain@2x.png 2x" alt="Instructions for terminating SCSI devices." style="width:400px; height:310px" /></p>

I was doing research into something – surprising though it may seem – and found [this random Spiceworks thread]. There are some goodies.

I've only been in the industry professionally for a decade, so my reach isn't that great. But I'm sure if you looked back on the history of this blog you'd find most of these floating around:

* Setting regular password rotation. All it does is encourages weaker passwords and insecure ingenuity.

* Short, indecipherable passwords are secure. A longer password with plain words has more entropy, and is more likely to be used because people remember them.

* Using FireWire 400 drives over USB 1.1 or 2. The transfer rate on the tin is slower than the latter, but it operates synchronously.

* Regularly defragmenting drives. Especially counterproductive with SSDs and other solid state media.

* RAID 5 and RAID Z. They get an unjustified bad rap now, but there are still better alternatives.

* Using AVG or Avast with Spybot Search and Destroy to protect Windows boxes.

* Setting Master/Slave jumpers on drives, because Cable Select is unreliable. And connect them with rounded ribbon cables for thermal efficiency! Except don't do the latter, because those cables were non-standard and often introduced crosstalk.

* Running 32 bit OSs on 64 bit hardware with less than 4 GiB of memory, to save system resources.

* Recommending people use SyQuest ORB drives over Iomega Jaz, because it had more capacity for less.

* Disabling HTTPS specifically for performance and resource use.

* Disabling IPv6 if you "don't need it." Though turning it on still introduces privacy concerns you need to be aware of and mitigate.

* Compiling your BSD and Gentoo ports from source, rather than using packages, to optimise performance. Better still, run overnight so you're not waiting hours for KDE to finish.

* Employing Web Safe Colours.

* Always terminating your SCSI devices! Or a life hack, always use an Iomega drive or EPSON scanner as the last device because they self-terminate.

* Using lighttpd over Apache, and MySQL over PostgreSQL, for performance and resource use.

* Using data archives on anything other than FreeBSD/ZFS.

* Writing with WordPress over Movable Type and Radio UserLand because its cleaner and lighter weight.

* Have you heard of this thing called Exchange? It's so much better than Notes!

And some things I was doing while still in school:

* Using a Zip disk box with a padlock to secure data!

* Using network hubs, and anything with an ISA interface, because network switches and PCI cards are more expensive.

* Use 8.3 filenames on web servers, so old computers could still view your site assets.

* RAMBUS that sucker! Okay, I could never afford that.

I'm sure Jim Kloss of XCHANGE and Whole Wheat Radio fame would have stories.

[this random Spiceworks thread]: https://community.spiceworks.com/topic/2167975-what-are-some-old-best-practices-that-are-no-longer-true

