---
title: "Airgapped devices and networks"
date: "2020-08-08T09:24:36+10:00"
abstract: "Logical networks do not an airgapped network make"
year: "2020"
category: Internet
tag:
- networking
- security
- scada
location: Sydney
---
I can't help noticing how the term *airgapped* has morphed over time, and the implied security and isolation that comes with it has been eroded.

In my past life doing process control and SCADA, air gapped meant exactly what it sounds like: a physical space between two devices separated with air. This wasn't a security consideration like it is in IT&mdash;or at least, not primarily&mdash;the two devices or cables were physically or electrically incompatible, or could cause serious problems with equipment if inadvertently connected. I'm talking about electrical fundamentals like connecting two discrete AC sources, or real-time networks with different protocols.

In IT we mostly discuss airgapped devices and networks as a security feature. A sensitive device deliberately not connected to the Internet would be a classic&mdash;and dare I say, increasingly and disturbingly rare&mdash;example. The term loses some of its literal meaning when we start talking about wireless networks, and there have been academic examples of using speakers to take control of airgapped devices. But it still ultimately refers to deliberately-isolated gear.

But now I'm starting to see the term employed in the industry for *logically* separated, as opposed to physical. I've seen devices connected over a VLAN or VPNs being described as airgapped in proposals and architecture diagrams, with the implication that they're as good as being physically separated. This doesn't pass mustard for me; a deliberate conflation of two English idioms because that's exactly what these pseudo-airgapped devices are doing.

While I concede physical separation is no panacea, and that airgapped devices can still be attacked in other ways, I think we're losing the meaning of the term using it more broadly like this. 

