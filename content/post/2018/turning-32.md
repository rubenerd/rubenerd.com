---
title: "Turning 32!"
date: "2018-03-27T22:07:43+11:00"
abstract: "I can now execute 32-bit code! And March in review."
thumb: "https://rubenerd.com/files/2018/twunk32-skifree-chipschallenge@1x.png"
year: "2018"
category: Thoughts
tag:
- personal
- bsd
- freebsd
- birthdays
- pointless-milestone
- written-in-sydney
---
I've been waiting to announce this since my sixteenth birthday in Singapore, which was now sixteen years ago (and a [decade after turning twenty-two] when promising I wouldn't [wear one]):

### I am now a 32-bit human!

That is, assuming the number of memory locations one can address corresponds to how many years one has been alive, which is almost certainly bullshit. However, that can't stop the fun.

I fired up my old Windows 2000 VM, like a gentleman, and composed this screenshot to mark the occasion. 

<p><img src="https://rubenerd.com/files/2018/twunk32-skifree-chipschallenge@1x.png" srcset="https://rubenerd.com/files/2018/twunk32-skifree-chipschallenge@@1x.png 1x, https://rubenerd.com/files/2018/twunk32-skifree-chipschallenge@2x.png 2x" alt="A screenshot from a Windows 2000 virtual machine depicting the ancient 16-bit Windows games SkiFree and Chips Challenge, with the twunk_16 and twunk_32 executables behind them" style="width:500px" /></p>

Yes, that's *Chips Challenge* and *SkiFree*, two of the best 16-bit games of all time. But what are those delightfully-Elmer Fuddian **twunk_XX** executables, I hear you ask? [Let's find out]\:

> In the field of software development, trunk refers to the unnamed branch (version) of a file tree under revision control.

I said *Thunk*, not *Trunk*. [Let's try that again]\:

> You can run 16-bit applications with 32-bit drivers on your Windows-based system as long as the 32-bit driver does not explicitly call Win32 API functions that create threads. The Windows on Windows (WOW) subsystem runs the applications in 16-bit mode and resolves 16-bit calls to the operating system.

I assume I'll require this to talk to people still on 16-bit brains, though with my current software toolkit it'd probably closer resemble [FreeBSD's Linux binary compatibility mode], which doesn't function if applications attempt to enter 8086 mode. We've come full circle!

What did I do on my thirty-second birthday? Wait, it lasted much longer than thirty seconds. Work was brutal, and interrupted breakfast and dinner celebrations with family. But I did have lunch with my rather fabulous colleagues, and Clara treated me to sushi and bubble tea in the evening.

<p><img src="https://rubenerd.com/files/2018/bsd-heroes@1x.jpg" srcset="https://rubenerd.com/files/2018/bsd-heroes@1x.jpg 1x, https://rubenerd.com/files/2018/bsd-heroes@2x.jpg 2x" alt="Photos of me with THE Benedict Reuschling and Allan Jude, still can't believe it!" style="width:500px; height:320px;" /></p>

On top of that, earlier this month I was in [Tokyo meeting my BSD heroes], and [buying myself a cute little computer]. But most importantly, my dad marked a year since his heart bypass surgery, and he's in fantastic health.

Sometimes when you're in the pits it's hard to see, but I've got a very, very good life. But here's the question: will I be lucky enough to write a follow-up when I become 64-bit? Let's find out ^\_^.

[decade after turning twenty-two]: https://rubenerd.com/p1099/ "I’m 22, but I won’t wear one!"
[wear one]: https://en.wikipedia.org/wiki/Tutu_(clothing) "Wikipedia: Tutu clothing"
[Let's find out]: https://en.wikipedia.org/wiki/Trunk_(software) "Wikipedia: Trunk (software)"
[Let's try that again]: https://docs.microsoft.com/en-us/sql/odbc/microsoft/using-16-bit-applications-with-32-bit-drivers
[FreeBSD's Linux binary compatibility mode]: https://www.freebsd.org/doc/handbook/linuxemu.html
[Tokyo meeting my BSD heroes]: https://twitter.com/Rubenerd/status/972973372605792256
[buying myself a cute little computer]: https://rubenerd.com/the-gpd-pocket/
