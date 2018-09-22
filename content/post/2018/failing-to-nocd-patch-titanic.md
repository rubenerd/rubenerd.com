---
draft: true
title: "Failing to no-cd patch Titanic"
date: "2018-08-19T21:58:32+10:00"
abstract: ""
thumb: ""
year: "2018"
location: Sydney
category: Software
tag:
- 
---
*This is part of an ongoing blog series exploring the restoration of my first computer from 1997, with parts from the first family computer in 1989, into the ultimate pointless nostalgia box.*

I wanted to run the original *Titanic: Adventure out of Time* game on my Pentium MMX tower, but I couldn't be bothered swapping CDs. I have a second CF card "hard drive" with a dozen or so logical partitions so I can run multimedia CD-ROMs, encyclopædieas, games, and the like.

So I assigned drive T: for Titanic—heh—and copied the two CDs into it. Then I ran the installer, and fired up the game.

<p><img src="https://rubenerd.com/files/2018/titanic-cd@1x.png" srcset="https://rubenerd.com/files/2018/titanic-cd@1x.png 1x, https://rubenerd.com/files/2018/titanic-cd@2x.png 2x" alt="Insert CD: Titanic needs another disc. Please insert the disc Titanic1 into your computer's CD-ROM drive and select OK to continue or Cancel to return to Windows." style="width:368px; height:185px;" /></p>

Ah yes, this game had copy protection. I forgot about that. Fortunately, I had an old patched copy of `TI.EXE` from when I played this game on Windows 2000 all those years ago.

<p><img src="https://rubenerd.com/files/2018/titanic-firstpatch@1x.png" srcset="https://rubenerd.com/files/2018/titanic-firstpatch@1x.png 1x, https://rubenerd.com/files/2018/titanic-firstpatch@2x.png 2x" alt="Unexpected error: 21." style="width:264px; height:137px" /></p>

Welp, that didn't work! What does it think it is with an error like that, iTunes?

I suspect this was for a proper 32-bit environment, not Win32s on Windows 3.11. Or it could just be a different, incompatible version of the game.

So I hit up DuckDuckGo and found [this FileForums thread] discussing how to patch your specific version. From Joe Forster/STA:

> This is for a different version but you can find the same byte sequence at physical offset 00035563 (= virtual address 00436163) in the TI.EXE you've uploaded. Funnily enough, the actual patch is hidden as it is taken for HTML code, but in the page source you can see that the bytes 74 1A (JE ...) should be changed to 90 90 (NOP NOP). (All values in hexadecimal.)

I found the excellent Hex Editor by Yuri Diomin I used to use on Windows 3.x [in the Internet Archive] of all places! I could have edited this on a conteporary machine, but it's been fun bringing this old tower out of retirement and work with the tools I used to use.

The sequence was at offset `00032E20` in my version:

<p><img src="https://rubenerd.com/files/2018/titanic-hex@1x.png" srcset="https://rubenerd.com/files/2018/titanic-hex@1x.png 1x, https://rubenerd.com/files/2018/titanic-hex@2x.png 2x" alt="Hex Edit showing the offset 00032E20 and 74 1A replaced with 90 90" style="width:500px; height:264px;" /></p>

Okay, let's try again!

<p><img src="https://rubenerd.com/files/2018/titanic-scripting@1x.png" srcset="https://rubenerd.com/files/2018/titanic-scripting@1x.png 1x, https://rubenerd.com/files/2018/titanic-scripting@2x.png 2x" alt="" style="width:342px; height:153px;" /></p>

Well, darn. Pressing `Yes` gets you a blank screen until you hit `ALT+F4`.

This is as far as I got. I should probably just run it in the Windows NT 4.0 partition, or shock horror run it from the CD. But now that I know this doesn't work, I'll need to fix it!

Maybe I could find an alternative version of the game from somewhere.

[this FileForums thread]: https://www.fileforums.com/showthread.php?t=93483
[in the Internet Archive]: https://archive.org/details/MEDLEY_SEC80007

