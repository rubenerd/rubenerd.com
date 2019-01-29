---
title: "A dodgy USB key"
date: "2018-12-11T10:39:29+11:00"
abstract: "uhub_reattach_port: giving up port reset - device vanished"
year: "2018"
category: Hardware
tag:
- bsd
- freebsd
- storage
- usb
location: sydney
---
I was having trouble with a USB 3.0 Kingston DataTraveller drive on my MacBook Pro. I was willing to assume it was a dodgy USB C adaptor cable, so I plugged it into my FreeBSD tower, like a gentleman. I hadn't seen `dmesg` output like this in a long time:

    uhub_reattach_port: giving up port reset - device vanished
    uhub_reattach_port: giving up port reset - device vanished
    uhub_reattach_port: giving up port reset - device vanished
    uhub_reattach_port: giving up port reset - device vanished
    uhub_reattach_port: giving up port reset - device vanished

I had three other identical keys, so I tried another one:

    ugen1.2: <Kingston DataTraveler 3.0> at usbus1
    umass0 on uhub0
    umass0: <Kingston DataTraveler 3.0, class 0/0, rev 3.10/0.01, addr 1> on usbus1
    umass0:  SCSI over Bulk-Only; quirks = 0xc100
    umass0:7:0: Attached to scbus7
    da0 at umass-sim0 bus 0 scbus7 target 0 lun 0
    da0: <Kingston DataTraveler 3.0 > Removable Direct Access SPC-4 SCSI device
    da0: Serial Number [blah]
    da0: 400.000MB/s transfers
    da0: 14755MB (30218842 512 byte sectors)
    da0: quirks=0x2<NO_6_BYTE>

And the other two worked the same. Plugged that first one back in, and the same `reattach_port` errors.

I'm amazed that for all the dozens -- perhaps hundreds -- of these I've had over the years, only one other key has failed this way when new. It's impressive.

