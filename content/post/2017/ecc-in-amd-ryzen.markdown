---
title: "ECC in AMD Ryzen"
date: "2017-03-26T19:24:00+10:00"
year: "2017"
abstract: "I could be going back to AMD for my next NAS"
year: "2017"
category: Hardware
tag: 
- amd
- cpus
- intel
- memory
- ryzen
- xeon
---
<figure><img src="https://rubenerd.com/files/2017/ryzen@1x.jpg" alt="" style="width:400px; height:160px" srcset="https://rubenerd.com/files/2017/ryzen@1x.jpg 1x, https://rubenerd.com/files/2017/ryzen@2x.jpg 2x" /></figure>

There was that period in the 2000s when anyone worth their salt build their game machines with AMDs. Athlons were faster, cheaper, and had that underdog status.

I've been looking for an excuse to build another AMD machine since my [last machine a decade ago]. My first game machine in years almost had an FX, but I got an i5 when it became obvious Intel had a clear thermal advantage; an important consideration for Mini-ITX builds.

Fast forward to this year, and I'd decided on the budget Xeon E3-1220 v5 for my Microserver replacement NAS. And low and behold, [AMD threw this down]:

> ECC is not disabled. It works, but not validated for our consumer client platform.
>  
> Validated means run it through server/workstation grade testing. For the first Ryzen processors, focused on the prosumer/gaming market, this feature is enabled and working but not validated by AMD. You should not have issues creating a whitebox homelab or NAS with ECC memory enabled.
> 
> yes, if you enable ECC support in the BIOS so check with the MB feature list before you buy.

In the words of Spock: *"fascinating."* Provided your board has support, ECC memory is within the reach of consumer tech for the first time. I've always wondered why ECC was limited to high end workstation and server rigs.

Now I'm considering a Ryzen for this NAS tower!

[last machine a decade ago]: https://rubenerd.com/sim-lim-square-and-the-athlon-x2/
[AMD threw this down]: https://www.overclock3d.net/news/cpu_mainboard/amd_confirms_that_ryzen_supports_ecc_memory/1

