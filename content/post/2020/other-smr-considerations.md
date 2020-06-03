---
title: "Other SMR considerations"
date: "2020-05-11T16:09:02+10:00"
abstract: "Via the Synology knowledge base"
year: "2020"
category: Hardware
tag:
- hard-drives
- smr
- storage
location: Sydney
---
Last week I wrote about the [latest flareup](https://rubenerd.com/hidden-shingled-drive-follow-up/) about shingled magnetic recording. SMR is useful for making more efficient use of platter space and therefore reducing costs, but at a performance penalty for random writes. This was exacerbated by drive manufacturers not labelling SMR drives as such, leading to the drives being used in environments for which SMR was not suited like RAIDs and ZFS pools. And by deliberately obfuscating the use of SMR in drive reporting, even file systems or RAID cards that could handle the inconsistent and slow performance of SMR wouldn't be aware to do so.

I was reading the [Synology knowledge base about SMR](https://www.synology.com/en-us/knowledgebase/DSM/tutorial/Storage/PMR_SMR_hard_disk_drives), and they had an interesting point:

> ... when the data on a [Shingled Magnetic Recording] drive is edited or overwritten, the write head will not overwrite the data onto the existing magnetic track. Instead, the new data will be written onto an empty area of the disk, while the original track with the old data will temporarily remain. When the HDD becomes idle, it will enter a reorganization mode where the old bits of data on the original track will be erased and made fully available for future use.
>
> This reorganization mode must occur to completely delete tracks, making the idle time essential for an SMR drive. If an SMR drive is being used heavily for read and writes, it will not have enough time to reorganize the magnetic tracks, causing the tracks with the old data to remain temporarily. As a result, the SMR drive may need to write new data and reorganize the old track at the same time, resulting in a negative impact on the overall read/write performance. To combat this, SMR drive manufacturers have developed firmware that optimizes the read/write performance while data is being overwritten.

My first thought was to what extent the tech would affect durability, when rumblings about hidden SMR came out in 2018. Without hard numbers all I could do was speculate, but it stands to reason that a drive that constantly has to perform data gymnastics as described above would have more physical wear than an equivalent capacity drive using conventional recording. At best this would only be partly negated with added intelligence to perform this reorganisation more efficiently, and that assumes the drive has sufficient idle time to do so.

Even if somehow these drives existed in a <del>parallel</del> serial universe where these additional writes physically came for free, the point Synology raised above leads to a larger and more scary question about data integrity. File systems and RAIDs depend on drives truthfully reporting when they've written data. As soon as a cache is introduced, or another layer of abstraction, the drive's firmware is lying to the OS or RAID controller about the current state of the drive. If you lose power between when the firmware reports data is written and when it actually has, it's gone.

*(Perhaps good SMRs have a persistent cache like hybrid drives, or they depend on a constant source of power to be safely deployed. Which, again, makes hiding the fact they're SMRs all that more dangerous).*

Trustworthy copy-on-write file systems like ZFS are better able to handle this; as are RAID controllers and drivers designed to be SMR-aware. But then we get back to that original issue of drives obfuscating the fact they're SMR, and people buying them assuming they're not. 

The only reasonable way to regain trust and confidence in these drives is for them to report they're SMR: in marketing, in technical specifications, and from the firmware itself. Lists on a blog post that may or may not be maintained, and that people may still otherwise be unaware of, are grossly insufficient.

