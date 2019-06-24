---
title: "Pitfalls of Windows 2012 R2 USB boot keys"
date: "2019-06-05T08:34:12+10:00"
abstract: "A long-winded, therapeutic rant about an unforgettable afternoon, where I dreamed of a cool glass of FreeBSD water."
year: "2019"
thumb: "https://rubenerd.com/files/2019/picardfacepalmthumb.jpg"
category: Software
tag:
- microsoft
- usb
- windows
- windows-server
location: Sydney
---
**TL;DR:** Use Rufus with GPT/UEFI if you can, and save yourself a ton of pain.

### Creating a key, the official Microsoft way

Responsible operating systems ship either with memory key images in the case of the BSDs, ISOs that also work when dd'd across in the case of Debian, or a simple script to convert. But if you have a reason to still make a Windows Server 2012 R2 USB boot key, things are unsurprisingly more complicated.

The official Microsoft way to create a bootable key is to use the official, confusingly-titled [Windows USB/DVD Download Tool](https://www.microsoft.com/en-us/download/windows-usb-dvd-download-tool). Make sure you're *logged out* [sic] of your Microsoft ID when downloading, or chances are you'll get the following error:

> **Sign In.** Sorry, but we're having trouble signing you in. AADSTS90015: Requested query string is too long.

Once downloaded, you copy it over to your trusty Windows virtual machine you keep around for specific occasions like this. You attach your USB key, provide the tool your ISO, then wait for the inevitable error messages:

> Status: Files copied successfully. However, we were unable to run bootsect to make the USB device bootable.

There are a multitude of reasons this can happen, but in my case it was attempting to make a 64-bit bootable USB key using a 32-bit Windows 7 virtual machine. If you're confused given the error message said *nothing of the sort*, that makes two of us. This can also come up if your hypervisor is passing through USB 3 with a USB 3 key, or USB 3 with USB 2, or you don't have the right drivers installed, or... *trails off*.


### Booting Windows Server 2012 R2 and failing 

Anyway, you have your bootable USB key, so you attempt to start some Quanta hardware in a rack with the data centre aircon vents inflaming your head cold, only for Windows Server 2012 R2 to confront you with this when you attempt to install to disk:

> We couldn't create a new partition or locate an existing one. For more information, see the Setup log files.

As an aside, this whole royal *we* thing, and computers talking in the first person by saying *hi, I'm doing this for you now* needs to stop. I'm not sure which focus group said this was a good idea, but it gets aggravating quickly when you're troubleshooting.

There are so many threads about this online, in part because it also affects Windows 7 and 8. Broadly their recommendations fall into the following categories, none of which worked for me, but maybe you'll have better luck:

* Unplug the key before reaching the disk detection screen.

* Use Diskpart to clear, partition, and set active, [as per this article](https://blogs.technet.microsoft.com/asiasupp/2012/03/06/error-we-couldnt-create-a-new-partition-or-locate-an-existing-one-for-more-information-see-the-setup-log-files-when-you-try-to-install-windows-8-cp/) in the delightfully-named *Microsoft Reduce Customer Effort Center*.

* Use a live \*nix CD to dd the target drive first to clear out any partition errors, either in place of above, or before.

* Set the USB key to be the first boot device in the BIOS. Or set your disk array(s) to be the first boot device in the BIOS. Basically, futz around with the boot order, rather than using the one-time boot option to start with USB.

* Disable USB. Yes, people say disable USB when you're saying you're having trouble booting from a USB key. I think data centre security walked passed me just to make sure my cackling laugher wasn't me dropping a server on my foot.

* Glare intensely at the KVM connected to the box until you guilt Window Server into doing what you paid for through your company's expensive SPLA.

* Boot using a USB CD-ROM instead. Which I entertained doing, before realising the ISO was *too big* for a regular DVD-ROM, and I couldn't find shops still selling dual-layer discs on short notice.


### Going back and using Rufus instead

So I did what I should have done from the start, and deployed Rufus. I've also had mixed success with this third party bootable USB key creator, most often I get the following error:

> This image is either non-bootable, or it uses a boot or compression method that is not supported by Rufus...

But it made light work of the Windows Server 2012 R2 Datacentre ISO I had. Which didn't work, in the same way as above. So I did a last *Hail Mary* and created a key with GPT/UEFI instead. Low and behold, with further BIOS tweaking the sucker booted, and installed. Hashtag *boom!*

