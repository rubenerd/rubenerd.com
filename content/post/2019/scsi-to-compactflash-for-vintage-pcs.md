---
title: "SCSI to CompactFlash for vintage PCs"
date: "2019-05-03T18:57:07+10:00"
abstract: "CompactFlash to SCSI adaptors exist! Need to try for my vintage computer builds."
thumb: "https://rubenerd.com/files/2019/scsiflash@1x.jpg"
year: "2019"
category: Hardware
tag:
- memory-cards
- mmx-build
- retro
- scsi
location: Sydney
---
I use passive CompactFlash to IDE adaptors for my vintage computer projects, with PCI-slot mounts so they can be easily swapped out when the machine is turned off. No need to pop the case off! Unfortunately it does limit the number of cards, especially when you throw in optical drives.

So I thought I'd research if SCSI to CompactFlash adaptors were a thing. I didn't think they would be; CompactFlash to IDE is easy because they share the same protocol, but how would a SCSI CompactFlash be presented to a system?

One approach is to emulate removable SCSI disks of yore. Solid State Disks have a [SCSIFlash](https://www.cf2scsi.com/datasheets/FLOPPY_SCSI_SSD_Drives/Removable_Drive_Emulations/CF2SCSI-SCSIFLASH-MO_SCSI_Magneto_Optic_Emulator_to_CF.pdf) box:

> The SCSIFlash™ is an industrial OEM grade solid state drive which allows Compact Flash (CF) cards of up to 128GB (host dependant) to be attached to a regular SCSI bus. **It will be seen as a SCSI Magneto Optic drive by the host computer.** The SCSIFlash™ can emulate many SASI, SCSI-1, or SCSI-2 drives and can be programmed to suit the host systems requirement. Emulated Disk Sector sizes can be 256, 512, 768, 1024, 2048, 4096 bytes

That's cool! We were firmly an Iomega household growing up, but my Japanese friends all used fancy magneto-optical systems and Minidiscs.

<p><img src="https://rubenerd.com/files/2019/scsiflash@1x.jpg" srcset="https://rubenerd.com/files/2019/scsiflash@1x.jpg 1x, https://rubenerd.com/files/2019/scsiflash@2x.jpg 2x" alt="" style="width:420px; height:365px;" /></p>

In the sidebar they list compatibility with these systems:

> DEC, Fujitsu, Hitachi, HP, IOMEGA, Konica, Maxoptix, Olympus, Pioneer, Ricoh, SONY, SYQUEST, TEAC.

I didn't think Iomega did Magneto-Optical. But in the [general description](https://www.cf2scsi.com/index.php/products/removable-drive-emulations/cf2scsi-scsiflash-zip-jaz-emulator-to-cf-detail) for the device:

> The IOMEGA SCSI ZIP emulator / SCSI Jaz emulator allows the CF Cards up to 64GB (SLC) and 256GB (MLC) to attach to the SCSI bus. It is seen as a IOMEGA SCSI ZIP/ Jaz Drive by the host computer.

So would you see multipe Jaz disks? Or does the protocol permit variable sizes?

This could work though, I already have drivers for DOS, and I'd assume classic FreeBSD and current NetBSD could work with it.

