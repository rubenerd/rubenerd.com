---
title: "Xorg: More than one possible primary device found"
date: "2018-12-02T13:34:50+11:00"
abstract: "If you see this on an HP Microserver, disable it in the BIOS."
year: "2018"
location: Sydney
category: Hardware
tag:
- bsd
- hp
- freebsd
- microserver
- troubleshooting
- xorg
---
Wow it's a *scorcher* outside. No wonder this Microserver's fan is running like crazy. But I digress; I saw this Xorg error on a FreeBSD Gen8 HP Microserver with a low profile PCI-E card:

    (!!) More than one possible primary device found

As the error suggests, Xorg is detecting multiple cards. One way is to configure `xorg.conf` manually, or `xorg.conf.d` files for each card. I don't use the onboard Matrox VGA, so I just disable it.

Reboot the Microserver and hit *F9* when prompted. Then choose *Advanced Options*, then *Video Options*, and choose *Optional Video Primary, Embedded Video Disabled*, as this pseudo-screengrab shows:

<pre style="line-height:1em !important">
ROM-Based Setup Utility, Version 3.00 ...
   
╔══╔════════════════════════════════════╗
║Sy║Advanced System ROM Options         ║
║PC║<strong>Video Options</strong>                       ║
║PC║Power Supply Requirements Override  ║
║PC║Thermal Configuration               ║
║St║S╔════════════════════════════════════════════════╗
║Bo║A║<strong>Optional Video Primary, Embedded Video Disabled</strong> ║
║Da║D║Optional Video Primary, Embedded Video Secondary║
║Se║A║Embedded Video Primary, Optional Video Secondary║
║Se╚═╚════════════════════════════════════════════════╝
║BIOS Serial Console & EMS ║
║Server Asset Text         ║
║<strong>Advanced Options</strong>          ║
║System Default Options    ║
║Utility Language          ║
╚══════════════════════════╝</pre>

Xorg should now start with startx, assuming you have the drivers configured or available for that PCI-E card. 
 
