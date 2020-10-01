---
title: "Ethernet papercuts"
date: "2020-09-20T09:31:06+10:00"
abstract: "The issue was a dodgy USB-A to USB-C connector the whole time!?"
year: "2020"
category: Hardware
tag:
- papercut-problems
- troubleshooting
location: Sydney
---
You know those class of problems that are just irritating enough to be noticed, but not enough for you to warrant spending time fixing? Canonical classed them [papercut problems](https://launchpad.net/hundredpapercuts), which I liked.

**Exhibit A:** I've been using the same USB-A to Ethernet dongle on MacBook Pros for a number of years. I say number, because any year would technically be a number, and I can't remember. But it's been a while.

The problems started earlier this year when network shares and SSH connections would drop, but [Mosh](https://mosh.org/) consoles and VPNs wouldn't. The longer timeouts on the latter, and Mosh's very design, were sufficient to maintain their connections even when something failed, but other network-dependent services couldn't handle these phantom dropouts. I just laughed it off as another flaky macOS Catalina issue, and didn't look into it further.

Keen-eyed readers may have spotted what my problem was right in the second paragraph. I realised last month the USB-A to USB-C cable I was using to connect the Ethernet dongle to the Mac wasn't especially tight. It never looked like it was being unplugged, but it was electrically disconnecting *just* enough to leak Ethernet packets all over the table. The issue I'd been living with since February was a flaky USB connection.

So I checked the budget, allocated a couple of coffees away from the drinks [envelope](https://en.wikipedia.org/wiki/Envelope_system "Wikipedia: Envelope system"), and bought a new USB-C to Ethernet dongle. And who'd have thunk it, *no more disconnections!* It's glorious!
