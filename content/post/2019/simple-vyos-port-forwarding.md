---
title: "Simple VyOS port forwarding"
date: "2019-07-30T21:35:47+10:00"
abstract: "set nat destination rule 100 description 'Would Prefer pfSense, but the client asked for it!'"
year: "2019"
category: Software
tag:
- networking
- vyos
location: Sydney
---
Speaking of VyOS, last week I learned&mdash;relearned?&mdash;how to configue a simple port forward from an interface with an internet routable address, to an internal network on another interface:

    $ configure
    # set nat destination rule 100 description "Would prefer pfSense!"
    # set nat destination rule 100 inbound-interface eth0
    # set nat destination rule 100 protocol tcp
    # set nat destination rule 100 translation address $TARGET_SERVER
    # set nat destination rule 100 translation port $TARGET_PORT

You'll want to change the rule number to get the order right.

