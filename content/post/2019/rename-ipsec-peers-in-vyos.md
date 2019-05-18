---
title: "Rename IPSec peers in VyOS"
date: "2019-05-07T16:47:22+10:00"
abstract: "rename peer $OLDPEER to peer $NEWPEER"
year: "2019"
category: Internet
tag:
- guides
- networking
- orionvm
- vpns
- vyos
- vyatta
location: Sydney
---
Here's something esoteric that I haven't had to do before. First confirm your configuration:

    # run show config

Scroll down and note the original peer you want to change:

    peer WishThisWasPFSense.example.com {
        [...]
    }

Then:

    # rename peer <OLDPEER> to peer <NEWPEER>
    # commit
    # save

I'm not a network engineer, so please don't ask for more details. I'm just glad you can rename; I'd assumed I'd have to make a new peer then delete the old one.

OrionVM includes VyOS as a software defined network template, and aside from my subtle dig above, it's a capable and rock solid router from our experience.

