---
title: "Intel’s discrete GPUs at CES"
date: "2020-01-12T20:33:19+11:00"
abstract: "People have mostly responded with meh, but I’m keen to see where this goes."
thumb: "https://rubenerd.com/files/2020/10th-gen-mobile-processor-rwd@1x.jpg"
year: "2020"
category: Hardware
tag:
- bsd
- freebsd
- intel
- games
- graphics
location: Sydney
---
Asha Barbaschow from ZDNet [wrote a fantastic summary](https://www.zdnet.com/article/ces-2020-intel-previews-tiger-lake-mobile-processors-and-discrete-gpu/) of Intel's CES announcements this year:

> Showing off Tiger Lake during the company's keynote at CES in Las Vegas on Monday, Intel executive vice president Gregory Bryant said the new processor will deliver "double digit performance gains", "massive" artificial intelligence performance improvements, better graphics performance, and 4x the throughput of USB3 with the new, integrated Thunderbolt 4.

Not requiring a separate chip to handle Thunderbolt is huge. Currently you need to have a capable computer, meaning the USB 3 port you have in your machine *might* be Thunderbolt capable, or it might not be. You always had the best chance of having it with Macs, but even then their 12-inch MacBook only shipped with USB 3 despite the connectors looking the same. This announcement takes us a step closer to ubiquity.

I wonder if AMD offer Thunderbolt on their Zen-architecture chips?

<p><img src="https://rubenerd.com/files/2020/10th-gen-mobile-processor-rwd@1x.jpg" srcset="https://rubenerd.com/files/2020/10th-gen-mobile-processor-rwd@1x.jpg 1x, https://rubenerd.com/files/2020/10th-gen-mobile-processor-rwd@2x.jpg 2x" alt="Photo from Intel showing their 10th generation mobile CPU." style="width:500px; height:210px;" /></p>

And on their new discrete GPU:

> Intel also offered a preview of the first Xe-based discrete GPU, code named DG1, with Intel vice president of architecture for graphics and software Lisa Pearce saying the new Intel Xe graphics architecture will provide "huge performance gains" in Tiger Lake.

I've seen Linus Tech Tips and other outlets discuss this card in detail, including the fact that while it might be a welcome boost for mobile, it has a long battle ahead to compete, and it's not Intel's first foray into this market segment.

Despite these muted responses, I'm *hugely* excited for this. Finally we might get some awesome graphics on free/open source platforms that don't depend on binary blobs or reverse engineering producing a necessarily inferior experience. Integrated Intel GPUs have always been easier to deal with on FreeBSD and similar systems due to mature, free drivers. If I could get the performance of a comparable Nvidia or AMD card on my home BSD tower, heck even *half* the performance, it'd be Christmas, Chinese New Year, and my birthday in one.

