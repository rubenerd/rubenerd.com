---
title: "The Ultimate KVM"
date: "2016-04-13T20:25:00+10:00"
---
I’ve been on the hunt for a good KVM for many years, but the search gained new urgency when I moved onto a smaller desk in a smaller apartment. Sydney's housing bubble won't pay for itself!

This would be my ideal setup:

<pre style="line-height:1em">
   ╔═════════════╗
   ║   iYuki the ║   
   ║ MacBook Air ╟───────┐
   ╚═════════════╝       │
 ╔═══════════════╗       │
 ║   Tsuruya the ║       │
 ║ DIY Gaming PC ╟─────┐ │
 ╚═══════════════╝     │ │               ╔══════════╗
╔════════════════╗     │ │         ┌─────╢ Keyboard ║ 
║        Mio the ║   ╔═╧═╧═════════╧═╗   ╚══════════╝
║ HP MicroServer ╟───╢               ║   ╔═════════╗
╚════════════════╝   ║ Ultimate KVM! ╟───╢ Display ║
╔════════════════╗   ║               ║   ╚═════════╝
║       Kyou the ║   ╚═╤═╤═╤═══════╤═╝   ╔═══════╗
║ HP MicroServer ╟─────┘ │ │       └─────╢ Mouse ║
╚════════════════╝       │ │             ╚═══════╝
 ╔═══════════════╗       │ │
 ║  GeeThree the ║       │ │
 ║   PowerMac G3 ╟───────┘ │
 ╚═══════════════╝         │
 ╔═══════════════╗         │
 ║  Ami the 1998 ║         │
 ║ DIY MMX Tower ╟─────────┘
 ╚═══════════════╝
</pre>

Predictably, this design had issues. The biggest was this veritable alphabet soup of connectors:

Machine             | Keyboard    | Video       | Mouse
--------------------|-------------|-------------|--------
MacBook Air         | USB         | DisplayPort | USB
DIY Gaming PC       | USB or PS/2 | DVI or HDMI | USB or PS/2
HP MicroServer (x2) | USB         | DE-15 VGA   | USB
PowerMac G3         | USB or ADB  | DE-15 VGA   | USB
DIY MMX Tower       | AT          | DE-15 VGA   | Serial

My first solution was a DVI/USB KVM, and use these adaptors:

* DVI &rarr; VGA
* USB &rarr; PS/2
* USB &rarr; PS/2 &rarr; AT (horrible, but it works)

Unfortunately, every such KVM I found used DVI-D which doesn't carry analogue signals. Therefore, no VGA connectors.

The second issue was scale. Four-port KVMs are rare and expensive compared to two-port units. For units with even more ports, you're talking serious money for loud and heavy rack-mountable units. For those prices, I'd rather spend the money upgrading hardware.

It would be a less elegant solution, but I decided to split the responsibility among a separate VGA and DVI KVM, with separate displays. This worked out okay, because it meant I could use a 4:3 aspect ratio display for those older computers that can't play with widescreens.

So for the first DVI KVM, which will attach to my current good monitor and peripherals:

<pre style="line-height:1em">
╔═══════════════════╗
║ MacBook Air   USB ║
║               USB ║
║                DP ║
╚═══════════════════╝
╔═════════════════════╗
║ DIY Gaming PC   USB ║
║                 USB ║
║                 DVI ║
╚═════════════════════╝
</pre>

And the VGA KVM which will get my 17" 1024x768 LCD, PS/2 keyboard and Hamburger Mouse:

<pre style="line-height:1em">
   ╔═══════════════════╗
   ║ MicroServer   USB ║
   ║                   ║
   ║               VGA ║
   ╚═══════════════════╝
   ╔═══════════════════╗
   ║ PowerMac G3   USB ║
   ║                   ║
   ║               VGA ║
   ╚═══════════════════╝
╔══════════════════════╗
║ 1998 DIY Tower   USB ║
║                  USB ║
║                  VGA ║
╚══════════════════════╝
</pre>

