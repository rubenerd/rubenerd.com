---
title: "Curious case of the 32 GiB key with only 64 MiB"
date: "2019-12-25T16:33:21+11:00"
abstract: "I haven’t had FreeBSD dmesg show a key as only a subset of its capacity before."
year: "2019"
category: Hardware
tag:
- apple
- bsd
- diskutil
- drives
- file-systems
- freebsd
- mac
- troubleshooting
- usb
location: Sydney
---
I was preparing my personal HP MicroServer for a fresh install of FreeBSD, like all good sysadmins do on days off. This entailed creating a bootable FreeBSD USB key installer. I had a spare 32 GiB USB 2.0 SanDisk Extreme which I figured would do the job, but for some reason I couldn't only copy 64 MiB [sic] of data to it before writes to it fell off a cliff.

Here it is accepting a disk image copy on my FreeBSD tower. I hit `CTRL+C` after more than half an hour with no progress:

    # dcfldd if=memstick.img of=/dev/da1 bs=2048
    32768 blocks (64Mb) written.^C
    32769+0 records in
    32768+0 records out

Writing plain zeroes had the same effect:

    # dcfldd if=/dev/zero of=/dev/disk6
    2048 blocks (64Mb) written.^C
    2049+0 records in
    2048+0 records out

Sure enough, FreeBSD `dmesg(8)` was only showing a 64 MiB key, the same size as my first ever USB 1.1 key back in the early 2000s:

    ugen0.3: <SanDisk Corporation Firebird6Up9> at usbus0
    umass2 on uhub5
    umass2: <String 2> on usbus0
    umass2:  SCSI over Bulk-Only; quirks = 0xc100
    umass2:9:2: Attached to scbus9
    da3 at umass-sim2 bus 2 scbus9 target 0 lun 0
    da3: <SanDisk Firebird 1.05> Removable Direct Access SCSI-2 device
    da3: Serial Number 0123456789ABCDEF
    da3: 40.000MB/s transfers
    da3: 64MB (131072 512 byte sectors)
    da3: quirks=0x2<NO_6_BYTE>

On the off chance it was a FreeBSD issue, I plugged it into my Mac laptop. Same effect:

<p><img src="https://rubenerd.com/files/2019/borked-key.png" alt="Disk Utility showing the key as only being 67.1 MB in size" style="width:500px; height:335px" /></p>

I've had keys formatted with exotic file systems, or GPT when a machine expects MBR, and whole drive encryption, and every combination of the above. But to be told the key itself only has a 64 MiB *total* capacity, as opposed to just its first file system, was surprising.

### Update

The plot thickens. After zero-ing out the first 64 MiB of this key, I plugged it into a USB-C port with an adaptor, and it came up as a 32 GiB key as expected, with a Mac partition table:

    /dev/disk4 (external, physical):
    #:                    TYPE NAME SIZE      IDENTIFIER
    0:  Apple_partition_scheme      *32.0 GB  disk4
    1:     Apple_partition_map       4.1 KB   disk4s1
    2:               Apple_HFS       2.4 MB   disk4s2

But `disk4s2` couldn't be mounted; presumably because I zero'd its MBR! Or was this key GPT, who knows? So I used `diskutil(8)` to create a new root MBR FAT32 partition:

    # sudo diskutil eraseDisk FAT32 "BLANK" /dev/disk4   
    Started erase on disk4
    Unmounting disk
    Creating the partition map
    Waiting for partitions to activate
    Formatting disk4s2 as MS-DOS (FAT32) with name BLANK
    512 bytes per physical sector
    /dev/rdisk4s2: 62087520 sectors in 1940235 FAT32 clusters (16384 bytes/cluster)
    bps=512 spc=32 res=32 nft=2 mid=0xf8 spt=32 hds=255 hid=411648 drv=0x80 
    bsec=62117888 bspf=15159 rdcl=2 infs=1 bkbs=6
    Mounting disk
    Finished erase on disk4

The Finder now showed it as a 32 GiB key. But then I plugged it into my FreeBSD tower again, and `dmesg(8)` showed the key timing out when attempting to connect:

    usbd_setup_device_desc: getting device descriptor at addr 5 failed, USB_ERR_TIMEOUT
    usbd_setup_device_desc: getting device descriptor at addr 5 failed, USB_ERR_TIMEOUT
    usbd_setup_device_desc: getting device descriptor at addr 5 failed, USB_ERR_TIMEOUT
    usbd_setup_device_desc: getting device descriptor at addr 5 failed, USB_ERR_TIMEOUT
    usbd_setup_device_desc: getting device descriptor at addr 5 failed, USB_ERR_TIMEOUT
    ugen0.5: <Unknown > at usbus0 (disconnected)
    uhub_reattach_port: could not allocate new device

And when I plugged it back into my Mac, I immediately got the dreaded *This disk is not initialised* error, despite it formatting and mounting correctly before being ejected.

I've seen this error in the past with some USB 3.0 hardware, and the suggested solution from IRC or forums (I forget) is to add this to your `/boot/loader.conf`. But it didn't help in this case, either because the key was USB 2.0, or there's a hardware problem.

    hw.usb.xhci.xhci_port_route=-1

My gut feeling now is the key hardware itself is fried. I'll keep it around for some experiments.

