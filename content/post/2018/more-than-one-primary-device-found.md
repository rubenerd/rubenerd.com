---
title: "More than one possible primary device found"
date: "2018-11-06T13:34:50+11:00"
abstract: ""
thumb: ""
year: "2018"
location: Sydney
category: Thoughts
tag:
- 
---
I saw this Xorg error on a FreeBSD Gen8 HP Microserver with a low profile PCI-E card:

    (!!) More than one possible primary device found

As the error suggests, Xorg is detecting multiple cards. One way is to configure xorg.conf manually, or xorg.conf.d files for each card. I don't use the onboard Matrox VGA, so I just disable it.

Reboot the Microserver and hit *F9* when prompted. Then choose *Advanced Options*, then *Video Options*, and choose *Optional Video Primary, Embedded Video Disabled*:

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
 
