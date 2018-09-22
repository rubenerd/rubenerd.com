---
title: "My Akihabara GPD Pocket"
date: "2018-03-24T10:20:11+11:00"
abstract: "It’s the first laptop to follow in the footsteps of the Toshiba Libretto"
thumb: "https://rubenerd.com/files/2018/gpd-xubuntu@2x.jpg"
year: "2018"
location: Sydney
category: Hardware
tag:
- bsd
- asiabsdcon
- freebsd
- xubuntu
- gpdpocket
- reviews
- postaday2018
---
<p><img src="https://rubenerd.com/files/2018/gpd-libretto@1x.jpg" srcset="https://rubenerd.com/files/2018/gpd-libretto@1x.jpg 1x, https://rubenerd.com/files/2018/gpd-libretto@2x.jpg 2x" alt="My Libretto 70CT and GPD Pocket" style="width:500px; height:375px;" /></p>

I've got so many post drafts either inspired by or directly discussing [AsiaBSDCon] I can barely keep track. So I thought I'd start with something fun that I can tie back to other things later.

It all started with a tweet by Mike Larkin [about his new GPD Pocket] he bought in Akihabara, running [his awesome OpenBSD vmm hypervisor]. I'd wanted one of these tiny, crowdfunded computers ever since I saw one, but the idea it was VT-x capable, and a prominent member of the BSD community had one, finally rendered my fiscal prudence inoperative.

<p style="font-style:italic">(VT-x is Intel’s hardware-accelerated virtualisation available on certain CPUs. Modern hypervisors like bhyve and vmm require it. This machine has a 64-bit quad-core Atom with VT-x, which blows my mind).</p>

So Clara and I went to Akihabara one evening, shopped around a bit, and snagged a new one complete with case, charger, and screen protector. In hindsight the charger was pretty dumb considering I'd be using it in Australia, but hey a USB-C cable's a USB-C cable!

[AsiaBSDCon]: https://2018.asiabsdcon.org/
[about his new GPD Pocket]: https://twitter.com/mlarkin2012/status/974559668977610752
[his awesome OpenBSD vmm hypervisor]: https://www.instagram.com/p/BgGzu_VnIGx/?taken-by=rubenschade
[quad-core Atom]: https://ark.intel.com/products/93362/Intel-Atom-x7-Z8750-Processor-2M-Cache-up-to-2_56-GHz

<p><img src="https://rubenerd.com/files/2018/gpd-akb@1x.jpg" srcset="https://rubenerd.com/files/2018/gpd-akb@1x.jpg 1x, https://rubenerd.com/files/2018/gpd-akb@2x.jpg 2x" alt="Photo taken around Akihabara" style="width:500px; height:375px;" /></p>

### The unit

Despite a few flaws, in my mind the GPD Pocket is the first machine worthy of following in the footsteps of the Toshiba Libretto. It's unfathomably small for a proper laptop, right down to the awkward keyboard layout and tiny screen. But in that small space we get a:

* 1.6GHz Atom x7-Z8750, quad core
* 8GiB LPDDR3-1600, if you set the BIOS RAM speed to "Auto"
* 7" 1920x1200 IPS display, which is Retina grade at 2x
* 128GiB eMMC

The external physical build quality is reminiscent of my Macs; the antithesis of those awful plastic netbooks of yore. And it only weighs 480g!

The benefit—dare I say necessity—of such a tiny, high resolution display is you can run your desktop environment at 2x/192dpi. I've been spoiled by Retina displays, so to have one in such a tiny machine is a double bonus. The only weird thing is it boots oriented in portrait mode, so you need to force X.org to rotate it back.

And while the keyboard puts stuff in odd places, the travel is better than Apple's current nasty butterfly switches. Go figure.

<p><img src="https://rubenerd.com/files/2018/gpd-bios@1x.jpg" srcset="https://rubenerd.com/files/2018/gpd-bios@1x.jpg 1x, https://rubenerd.com/files/2018/gpd-bios@2x.jpg 2x" alt="Photo showing the BIOS rotated in portrait mode on the display" style="width:500px; height:375px;" /></p>


### Flashing the BIOS

I generally eschew (gesundheit) Reddit, but <a href="https://www.reddit.com/r/gpdpocket" rel="nofollow">/r/gpdpocket</a> is invaluable. According to their wiki, you want to download and flash GPD's unlocked BIOS to enable or unlock extra features, like full-speed memory.

This turned out to be a harrowing experience, not least due to the official documentation being ambiguous on some of the steps. I ran the install script in Windows and got an ASCII-art **PASS**, but when I restarted for the new BIOS to install as per the official docs, the screen went black and seemingly did nothing.

I waited half an hour, then issued a CTRL+ALT+DEL, and Windows booted back up. Whew!

Getting into the BIOS took me longer to figure out than it perhaps should have, but the key is to hit DEL once you see the first GPD logo on boot. Your reward is a surreal, portrait-stretched BIOS with a cursor.

### Installing Linux

I eventually want FreeBSD on this device, dual-booted or otherwise. Partly because I'm a gentleman, but also I want the giddy thrill of a 480g bhyve box. Hell, maybe even dual-boot it with OpenBSD for vmm too. This will no doubt be a weekend project.

But for some instant gratification and a proof of concept, I used nexus511's excellent [modified Xubuntu distro] that bundles many of the Linux kernel patches and other fixes required for this odd grab-bag of hardware. To the credit of all those tireless maintainers, everything just worked.

I'll probably throw dwm, or xmonad, or i3, or whatever tiled window manager the cool people use today, but for now I'm just rocking standard [Xfce]; my [favourite desktop environment] of all time.

<p><img src="https://rubenerd.com/files/2018/gpd-xubuntu@1x.jpg" srcset="https://rubenerd.com/files/2018/gpd-xubuntu@1x.jpg 1x, https://rubenerd.com/files/2018/gpd-xubuntu@2x.jpg 2x" alt="My updated GPD Pocket with Xubuntu" style="width:500px; height:375px;" /></p>


### Usage

I bought this principally to tinker with BSD, because I'm a sucker for tiny computers, and it was an excuse to explore Akihabara yet again. Everything that follows is a lie.

But the other reason was to supplant my MacBook as my primary luggable. I need a laptop with me when I'm on call, so this thing with VPNs, SSH, RDP, and a serial adaptor for console access could make it the ultimate remote debugger. We'll see.

[modified Xubuntu distro]: https://apt.nexus511.net/
[favourite desktop environment]: https://rubenerd.com/p1185/
[Xfce]: https://xfce.org/
