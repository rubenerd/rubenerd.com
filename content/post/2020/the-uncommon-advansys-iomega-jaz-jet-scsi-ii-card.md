---
title: "Uncommon Advansys Iomega Jaz Jet SCSI-II cards"
date: "2020-08-25T20:40:24+10:00"
abstract: "They weren’t all rebadged Adaptec units."
thumb: "https://rubenerd.com/files/2020/jaz-jet-screenshot@1x.png"
year: "2020"
category: Hardware
tag:
- drives
- iomega
- nostalgia
- scsi
location: Sydney
---
Before the advent of modern serial interfaces in the 1990s, you had the option of using parallel ports or SCSI for connecting external PC drives. Parallel ports were ubiquitous and supported printer pass-through, but they was slow even by the standards of the day. SCSI was daisy-chainable and could surpass the performance of an internal drive, but far fewer people had SCSI cards. Including me, until we got an EPSON scanner back in the day.

Iomega offered a solution in their *Jaz Jet PCI SCSI Accelerator* card. This allowed people to connect the Jaz drive which only came in SCSI, and the Zip Plus that offered higher speeds than their standard parallel port Zip drives.

But here's where things got a bit weird. Look on eBay and on driver sites for this card, and you'll invariably be told they were rebadged [Adaptec AHA-2930Us](https://adaptec.com/en-us/support/scsi/2930/aha-2930u/). Windows 95's Add New Hardware wizard even installed a driver for this specific card when I selected the *Jaz Jet PCI SCSI Accelerator*, which proceeded not to work.

What was going on!? I checked the underside of this card I got from a family friend years ago, and realised it said **ADP-960**. The primary silicon also didn't have the Adaptec branding anywhere, it said *Advansys*.

<p><img src="https://rubenerd.com/files/2020/abp-960@1x.jpg" srcset="https://rubenerd.com/files/2020/abp-960@1x.jpg 1x, https://rubenerd.com/files/2020/abp-960@2x.jpg 2x" alt="View of the card showing the model number and Iomega logo" style="width:500px; height:333px;" /></p>

I did a search for both and came across [valvestate's comment](http://www.vcfed.org/forum/showthread.php?61859-Iomega-Jaz-Jet-SCSI-No-adapters-found-in-DOS-(solved)) on the Vintage Computer Federation forums, emphasis added:

> Hi Everyone. New guy here. Found this place just after I got mostly everything working -- setting up DOS 6 on a scuzzy removable disk on a Pentium 3 machine I have lying around. Don't ask why, I have a masochistic fascination with older removable storage. Figured my first post can be a contribution with all the hair I pulled over it.

You and me both! There are few things as fascinating as vintage computer and Hi-Fi disk systems.

> So after surfing the net trying to find DOS drivers and trying them all for the Iomega Jaz Jet SCSI PCI card, I kept getting an error with the ASPI drivers saying that no adapters were found. **Supposedly it was a rebadged Adaptec 2930U, but mine was not, it was an Advanced System Products card, labelled as ABP-960U.** The card worked in Windows with some TLC, but still wouldn't in DOS.
> 
> I had a hunch and pulled the PCI ID in Windows, looked it up online, and found my card had a slightly different Sybsystem ID from what the database showed for an ABP-960U. I hexedited the driver, advaspi.sys at byte 8D83, changing 10 to 30, and it worked. If you ever run into this, just search for 1310 and change it to 1330. In my file, there was only one instance of the word 1310.

I fortunately didn't have to go that far to get it to work. Using the Iomega Tools floppy specifically from the Iomega Jaz drive, then choosing the specific model in the Windows 95 Add New hardware wizard did the trick:

<p><img src="https://rubenerd.com/files/2020/jaz-jet-screenshot@1x.png" srcset="https://rubenerd.com/files/2020/jaz-jet-screenshot@1x.png 1x, https://rubenerd.com/files/2020/jaz-jet-screenshot@2x.png 2x" alt="Screenshot of Windows 95 C showing the Iomega Properties pane for the Jaz drive" style="width:500px; height:333px;" /></p>

And people say I do pointless things on my day off.

