---
title: "Rubenerd lame encoding"
date: "2007-12-14T18:19:00+00:00"
category: Media
tag:
- audio
- audio-magazines
- from-tumblr
- guides
- podcasting
- new-time-radio
- rubenerd-show
---
We shouldn't be surprised at its horrible name, given its an open source project. But I couldn't imagine encoding episodes of the Rubenerd Show any other way :).

    lame \
        -h \
        -m m \
        -b 64 \
        -resample 22.05 \
        -mp3input \
        -tt "RubenerdShow230 2007.12.15" \
        -ta "Ruben Schade" \
        -tl "rubenerd.com/show/" \
        -ty 2007 \
        -tn 230 \
        -add-id3v2 \
        RubenerdShow230_320.mp3 \
        RubenerdShow230.mp3

