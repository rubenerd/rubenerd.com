---
title: "Using a 4K LG UltraFine display with FreeBSD?"
date: "2019-04-04T13:58:33+11:00"
abstract: "Getting a Sunix UPD2018 to share this display with a Mac."
thumb: "https://rubenerd.com/files/2019/sunix-UPD2018@1x.jpg"
year: "2019"
category: Hardware
tag:
- bsd
- displays
- freebsd
- monitors
location: Sydney
---
*I didn’t mean to invoke [Betteride's Law of Headlines] here, the question mark here indicates I'm mulling my options, not that I'm saying it can't be done.*

I have a MacBook Pro semi-permanently connected to a gorgeous 4K LG UltraFine display as my primary home desktop. I barely used my Retina iMac, so I sold it and bought this display instead. Once you go 2× HiDPI/Retina, you can't go back.

My other main desktop is a FreeBSD tower I originally built as a game machine, before realising I barely play games. I've found myself using it more and more since wiping Windows off it, and am mulling switching this LG display to it.

Problem is, it unsurprisingly uses a very particular type of USB-C 3.1 connector that carries DisplayPort Alt-Mode, so using a passive adaptor doesn't work. The display also has a built-in USB-C dock, but that's less important to get working.

<p><img src="https://rubenerd.com/files/2019/sunix-UPD2018@1x.jpg" srcset="https://rubenerd.com/files/2019/sunix-UPD2018@1x.jpg 1x, https://rubenerd.com/files/2019/sunix-UPD2018@2x.jpg 2x" alt="" style="width:500px; height:185px;" /></p>

According to a [few Reddit posts], this [UPD2018 board by Sunix] lets you connect the display to your desktop by passing through the DisplayPort output of your graphics card, in my case an older Nvidia GTX 960. My NCASE M1 has one spare PCI slot, so this could work.

*(I’m getting flashbacks to my friends using Voodoo cards connected to the VGA output of their 2D graphics cards in the late 1990s!)*

The budget for this month is a little tight on account of Clara's and my recent Japan trip, but I'll grab one of these next month and report back how I go.

[Betteride's Law of Headlines]: https://rubenerd.com/considered-harmful-is-considered-harmful/ "Rubenerd Law of Headlines"
[few Reddit posts]: https://www.reddit.com/r/apple/comments/5fan7e/lg_ultrafine_4k_compatible_with_windows_10_on_a_pc/db3eikv/ "Rubenerd: LG UltraFine 4K compatible with Windows 10 on a PC?"
[UPD2018 board by Sunix]: http://www.sunixusa.com/product/upd2018/ "UPD2018 - USB 3.1 10G & DisplayPort Alt-Mode PCI Express Host Card with Dual USB Type-C Receptacles (Gen2)"

