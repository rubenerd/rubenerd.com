---
title: "That's a big desktop VM"
date: "2017-12-13T08:54:20+11:00"
abstract: "Using GrandPerspective to figure out where hell of my drive space went"
year: "2017"
category: Software
tag:
- drives
location: sydney
---
Where'd all the drive space on this MacBook Pro go? What a handsome question. Let's ask [GrandPerspective], the tool every Mac user should have. [WinDirStat] and [QDirStat] are useful analogues for those of you on Windows or Linux/BSD.

<p><img src="https://rubenerd.com/files/2017/grandperspective-vm.png" alt="Screenshot from GrandPerspective showing one file taking up at least half my drive" style="width:500px; height:198px;" />

Well then! Not to get all Malcom Gladwell on you, but *turns out* that gigantic rectangle is a Windows 7 virtual machine bundle created to help with ~~games~~ interfacing with old BMCs and other poorly-written, Windows-only utilities. In a fit of shortsightedness, I provisioned it as a preallocated disk for performance reasons, but on SSDs in 2017 I barely noticed a difference.

If I had used a default [sparse disk], I could compact it.

**Update 1**: Turns out this VM wouldn't have compacted well anyway, it's cached every single Windows Update it ever did. The `Windows` folder is over 100GB!

**Update 2:** Comes after update 1.

**Update 3:** Remember when that folder was `C:\WINNT`? Jim Kloss would remember. It was even still the case with Windows 2000. Now if I didn't also need this VM for ~~games~~ 64bit Windows software, I'd use 2000 in this capacity. It'd probably still work. ~~Chips Challenge and SkiFree still would too~~.

**Update 4:** *Windows 2000, built on NT Technology*, it said. Or expanded out, *Windows 2000, built on New Technology Technology*.

[GrandPerspective]: http://grandperspectiv.sourceforge.net
[sparse disk]: https://kb.vmware.com/s/article/1001934
[WinDirStat]: https://windirstat.net/
[QDirStat]: https://github.com/shundhammer/qdirstat

