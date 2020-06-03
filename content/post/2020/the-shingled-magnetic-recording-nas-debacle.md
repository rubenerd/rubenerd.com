---
title: "The Shingled magnetic recording NAS debacle"
date: "2020-04-27T08:07:23+10:00"
abstract: "I can’t get my head around why they would hide this, given ZFS and RAIDs immediately demonstrate it."
year: "2020"
category: Hardware
tag:
- business
- hard-drives
- raids
- zfs
location: Sydney
---
Shingled magnetic recording was a brilliant hack when Seagate announced their 8 TB archival drive in 2014. SMR drives partially overlap tracks, exploiting the fact read heads are narrower than write heads. You can achieve greater density for less cost this way, but it means subsequent writes require adjacent tracks to also be rewritten, which negatively affects random-write performance.

As an industry we decided the best use for these drives were price-sensitive and <abbr title="write once, read many">WORM</abbr> applications, like content delivery.

So it came as a surprise when sysadmins began noticing their new Western Digital Red NAS drives were dropping out of NAS RAIDs and ZFS pools owing to random write timeouts and failures. This behaviour is consistent with how SMR drives respond to random writes, as RAID and ZFS store their metadata. This thread on the [Smartmontools bug tracker](https://www.smartmontools.org/ticket/1313) was eye-opening:

> There are a lot of SMR drives quietly submarining into supply channels that are programmed to "look" like "conventional" drives (CMR). This appears to be an attempt to end-run around consumer resistance ... WD and Seagate are _both_ shipping drive-managed SMR (DM-SMR) drives which don't report themselves as SMR when questioned via conventional means. ... What's worse, they're shipping DM-SMR drives as "RAID" and "NAS" drives
 
Western Digital finally admitted that [many of their drives now use SMR](https://blog.westerndigital.com/wd-red-nas-drives/), including their Red drives which are advertised for use in NASs. *Blocks and Files* reported that [Seagate](https://blocksandfiles.com/2020/04/15/seagate-2-4-and-8tb-barracuda-and-desktop-hdd-smr/) and [Toshiba](https://blocksandfiles.com/2020/04/16/toshiba-desktop-disk-drives-undocumented-shingle-magnetic-recording/) have admitted to doing the same thing, though both made clear that none of their NAS-branded drives do.

There is so much to technically unpack about this story, but I'm just as interested in the human element.

From the outside it seems downright bizarre that WD specifically would squander the wave of positive press they were riding from the likes of Backblaze saying their drives&mdash;and those of their HGST subsidiary&mdash;were more trustworthy and reliable. With one management decision, engineers will now be second-guessing their choices for using WD drives in their storage arrays. Is this drive on WD's SMR list? If not, can I trust that it doesn't use it, given they were willing to hide the fact before?

For this to have happened, management at these companies would have had to decide explicitely or otherwise that:

1. Using SMR would make their devices cheaper

2. Using SMR would save them money producing each unit

2. Buyers wouldn't notice

The first two points I get, they're business reality. Profit margins on complicated, mass-produced tech like this must be receding faster than my early-30s hairline (welp), and competition for research and development is steep. Offering a cheaper product in (1) would be reasonable; keeping the margin in (2) seems dubious but at least you can understand it. 

But (3) was a gross miscalculation. Even if they thought they'd sufficiently improved the performance of SMR for use in general computing and NASs, adding fresh SMR drives to RAIDs and ZFS pools immediately  and transparently demonstrates this to be false.
 
Which is all the more reason obfuscating the use of SMR was bizarre. The fact they did is an admission that people wouldn't voluntarily choose to use the tech, especially in specific work loads like NASs. If we follow this to its logical conclusion:

1. Customers would have bought what they thought were conventional drives, informed by the fact they're labelled as NAS drives for use in RAID arrays that require decent random-write performance, especially during resilvering.

2. The drives would immediately report problems that are consistent with outright failures on conventional hardware. SMR-aware tools on Linux and FreeBSD wouldn't notice, because their SMR operation has been obfuscated.

3. Customers would report these faults, lodge support cases, and return items at the cost of the manufacturer. Replacement units wouldn't solve the problem, as the fundamental tech isn't designed for the purpose in which its being used and advertised. People become sad.

It's *good* we have SMR drives; they provide the cost benefits of cold storage but with immediate read access. But just as I wouldn't use USB flash storage for a ZFS ZIL SLOG, or wear my hat on my elbow, SMR is not fit for NAS use.

Companies and their PR departments **never get** that it wasn't the use of `$tech` that generated animosity, it's that it was hidden. It's not the first time it's happened, and we all know it won't be the last. Hey that's a good paragraph, I'll quote it next time!

