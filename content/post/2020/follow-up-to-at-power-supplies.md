---
title: "Follow-up to AT power supplies"
date: "2020-07-04T08:32:18+10:00"
abstract: "From Hales of Haelstrom.net"
thumb: "https://rubenerd.com/files/2020/athena-at.jpg"
year: "2020"
category: Hardware
tag:
- comments
- power-supplies
- vintage
location: Sydney
---
Last Thursday I wrote about a [noisy replacement AT power supply](https://rubenerd.com/the-athena-at40-400w-at-power-supply/) for my old Pentium tower:

> It seems it suffers from a loud fan, and no dynamic controls to adjust its speed depending on temperature or load. This would be fine in an industrial setting, or maybe an open-plan office where you’re running legacy hardware for certain reasons, but at home it’s simply too loud.

Hales of [Haelstrom.net](http://halestrom.net/darksleep/) confirmed my suspicions about it being targeted at industry. He linked to the [manufacturer's website](http://athenapower.com/product/power-supply/at/ap-at40?quicktabs_1=1#quicktabs-1)\:

> Circa 1998; the AT Power Supply has been around for 23 years and it is still going strong in today’s industry.  It is used to power equipment from the smallest robotic drill to essential medical equipment.  Athena Computer Power understands the importance of these Power Supplies and has boosted the wattage up to 400; supplying more power while maintaining reliability and control.

He explains:

> That probably explains their little care for noise. The fan will be wired directly to the 12V rail and it will be a standard (non-low-RPM) 80MM model. They *could* have run it slower at lower loads, but that would require more circuitry.
> 
> It doesn't look like there is much on the market for AT-40 replacement PSUs other than Athena & old 2nd hand units. That's kind of sucky.
> 
> I was hoping for some ATX to AT adaptor boards + cable harnesses to exist, but I can't find any of those either. Modern ATX power supplies skip the -5V and -12V rails so you need a little circuit to generate a small amount of those. You also have to make sure the 5V rail is big enough, but there are still some units around that fix that problem.

My budget is a little tight this month, but I'll be looking to see what the legacy motherboard in this machine supports and requires. It'd be great if I could use a contemporary ATX supply with adaptors.

Hales continues in a follow-up this morning:

> Depending on your RAM type you might be able to get away without the -5V or -12V rails (most modern ATX power supplies don't provide them or only provide one).  Some ISA cards might not work however and the RS232 chip might not output within spec (if it doesn't have an in-built chargepump), but you might not care about that feature anyway.

I use two of the tree ISA slots in this machine for my vintage sound cards, so I'll need to confirm that. But it sounds like this will be a fun project to research :).
