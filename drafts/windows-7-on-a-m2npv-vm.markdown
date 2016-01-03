---
title: "Windows 7 on an M2NPV-VM"
date: "2015-12-25T16:41:00+10:00"
summary: "Disable the floppy controller"
category: Software
tag:
- amd
- guides
- windows
- windows-7
---
As part of a Christmas shutdown break project, I decided to resurrect an older DIY tower and give it to my old man as an iTunes media server. Its not Hackintoshible, nor could I be bothered to make it one if it was, so Windows 7 it was.

For all the people long defending what's considered Microsoft's last good desktop OS, it's just as touchy to install as ever before. At this stage, desktop Linux works more reliably out of the box.

Installing Windows 7 Enterprise (32bit and 64bit) resulted in a hung setup screen. Forums suggest you remove RAM DIMMs one by one, and all non-essential expansion cards until it can install, then try again. Ah, I remember those days. Doing so yielded the same results.

I can't find where this was originally suggested, but the solution was to disable the floppy drive controller in the logic board BIOS, regardless of whether a drive is installed. After doing this, the machine booted the setup program.

