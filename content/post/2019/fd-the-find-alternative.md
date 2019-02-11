---
title: "fd, the find alternative"
date: "2019-02-01T19:28:28+11:00"
abstract: "This may be my favourite new utility in a long time."
thumb: "https://rubenerd.com/files/2019/friarduck@1x.jpg"
year: "2019"
category: Software
tag:
- bsd
- freebsd
- shell
- tools
location: sydney
---
<p><img src="https://rubenerd.com/files/2019/friarduck@1x.jpg" srcset="https://rubenerd.com/files/2019/friarduck@1x.jpg 1x, https://rubenerd.com/files/2019/friarduck@2x.jpg 2x" alt="" style="width:320px; height:234px;" /></p>

Today I learned about <code>[fd]</code>, an alternative to <code>[find]</code> written in Rust. Its easy syntax is reason enough to use it, but check out the *speed* with which it found posts in this site's git repository:

    $ time find . -name *bsd*
    ==> real 0m0.595s
    ==> user 0m0.054s
    ==> sys  0m0.285s
      
       
    $ time fd bsd
    ==> real 0m0.030s
    ==> user 0m0.028s
    ==> sys  0m0.026s

This is now in my toolchain, so I can invoke *[Friar Duck]* for all searches. *To trip to trip it trip trip tripo tripa argh a trip a trippit trippit oh argh trippit oh trip it... tripping up and down! ♫*

[fd]: https://github.com/sharkdp/fd
[find]: https://www.freebsd.org/cgi/man.cgi?query=find
[ack]: https://beyondgrep.com/
[Friar Duck]: https://en.wikipedia.org/wiki/Robin_Hood_Daffy

