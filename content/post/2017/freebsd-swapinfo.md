---
title: "FreeBSD swapinfo"
date: "2017-12-07T18:12:17+11:00"
abstract: "Seeing how much virtual memory you’re using."
category: Software
tag:
- bsd
- freebsd
- ram
---
Today I learned:

> Want to see how much virtual memory you're using? Just type "swapinfo" to be shown information about the usage of your swap partitions.

Sure enough:

    Device          1K-blocks     Used    Avail Capacity
    /dev/md99          524288    22316   501972     4%

Boom!

