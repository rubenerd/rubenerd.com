---
title: "KVM trolley suggestions for data centre operators"
date: "2019-06-20T22:28:22+10:00"
abstract: "GAH my kingdom for a VGA cable without bent pins, and clearly labelled USB cables!"
year: "2019"
category: Hardware
tag:
- data-centre
- keyboards
- kvm
- mouses
- peripherals
location: Sydney
---
Work has a secondary data centre <abbr style="border:0; text-decoration:none;" title="point of presence" >PoP</abbr> in Sydney for clients needing disaster recovery and remote backups within the same locale. We use the common trolley <abbr style="border:0; text-decoration:none;" title="keyboard video mouse">KVMs</abbr> supplied by the data centre, because its not a full deployment worth buying our own gear for.

Use of these shared KVMs over the years has lead me to a few observations and suggestions for those tasked with deploying and maintaining these trolleys:

**KVM VGA cables should be routinely inspected for bent pins!**
: Plugging into a BSD or Linux server is fine; but plug into Windows Server GUI with a flaky green and black display and you're gonna have a bad time.<p></p>

**USB peripheral cables should be clearly marked.**
: If I'm booting from a USB key, and there are only two ports, I'm only going to be plugging in a keyboard. Yes I can just plug one at a time and see if the light comes up for Num Lock or the LED under the mouse, but we shouldn't need to.<p></p>

**Wheels should not be wobbly, and be sufficiently oiled.**
: If you're there late at night, the last thing you need is a shrill, piercing noise of someone passing you with their trolley. You also run the risk of vibrating surfaces distributing screws off the trolley and into the raised floor air conditioning vents, never to be seen again.<p></p>

**Debris should be routinely cleared.**
: It's a fact these trolleys double as portable work surfaces for cable crimping, replacing snapped Ethernet plugs, and discarding redundant blanking plates. Then there are the cable ties, rubber bands, pens, and the odd expensive fibre module. I take litter with me because I'm not a monster, but some people are.<p></p>

**We should consider naming KVM trolleys something else.** 
: These days people assume I'm referring to hypervisors, even if my experience is with Xen/QEMU and to a lesser extent bhyve. It's also only a letter away from the Malaysian train service. The order of the letters are entirely arbitrary, maybe we should call them VMKs. Except that's too close to VMDK, damn it.<p></p>

**There should be another thing, because I like even-numbered lists.**
: Purple monkey dish washer.

I'm not part of the core backend team anymore, but these small changes would still immeasurably improve my quality of life.

