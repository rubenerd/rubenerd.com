---
title: "Hidden shingled-drive follow-up"
date: "2020-05-05T17:58:39+10:00"
abstract: "“...does not mean we should deprive them of an opportunity to make informed purchasing decisions to protect their livelihoods and memories.”"
year: "2020"
category: Hardware
tag:
- hard-drives
location: Sydney
---
I should have titled this with *mostly-hidden* so I could have had three consecutive hyphens.

[Patrick Kennedy has weighed in](https://www.servethehome.com/surreptitiously-swapping-smr-into-hard-drives-must-end/) on the hidden shingled recording debate over on STH. It was an assertive but balanced summary of what's going on. His conclusion hits the nail on the head, emphasis added:

> For those who think it is OK to obfuscate vital product information to a lower-cost segment of customers, I offer this: just because someone or some business does not have the opportunity or means to purchase a higher-end drive, does not mean we should deprive them of an opportunity to make **informed purchasing decisions to protect their livelihoods and memories.**

[Michael Dexter](https://callfortesting.org/) commented at AsiaBSDCon 2019 that all it takes is for a file system or drive to shred your data once, and your trust in it permanently gone. Those are the stakes, whether it's OpenZFS on a new OS architecture, or a class of hard drives.

This is what I found most disturbing about this obfuscation. People are trusting their critical data to these drives, from sysadmins in data centres to home users with their NASs. Arguing that people get what they pay for, as mentioned in these companies' PR announcements, assumes consumers were in possession of all the facts when deciding on the cheap option. This clearly wasn't the case.

Others in the comments suggested further stratification of the storage market is the only real endgame here. I agree; the only reasonable outcome would be drive manufacturers offering cheaper SMR drives, and charging a premium for ones guaranteed not to use it.

I do empathise with their position. We're reaching the physical limits of storage miniaturisation with this tech. SSDs have kicked them out of most performance applications, and are nipping at their feet at lower capacities. As Patrick says:

> Let us be clear, in 2020, there are a few reasons one buys a 2TB to 6TB hard drive. The biggest, by far, is cost. There are consumers and businesses who have tight budgets and cannot afford higher capacity hard drives for their storage. Storage density is a big deal and there are significant costs to just connect a hard drive to a NAS or PC. Also, fewer drives mean less vibration, noise, power consumption, and heat. 

There are significant benefits to building arrays with more drives if you're hosting high and variable IO workloads like virtualisation, but for NASs and bulk storage Patrick hits the nail on the head. Though I suspect eventually SSDs will take that away too, once the cost per gigabyte makes spinning drives untenable.

