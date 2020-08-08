---
title: "Blog retrospective: 720K floppies"
date: "2020-06-28T22:43:40+10:00"
abstract: "A decade ago these floppy disks were still old!"
thumb: ""
year: "2020"
category: Hardware
tag:
- floppy-disks
- nostalgia
- retrospective
- windows
location: Sydney
---
<p><img src="https://rubenerd.com/files/2020/screenie.format.720@1x.png" srcset="https://rubenerd.com/files/2020/screenie.format.720@1x.png 1x, https://rubenerd.com/files/2020/screenie.format.720@2x.png 2x" alt="Screenshot showing disk formatting progress." style="width:500px" /></p>

I haven't done a blog retrospective in a while. Today's post from exactly decade ago discussed [formatting 720K floppies in Windows XP](https://rubenerd.com/format-720k-disk-windows-xp/)\:

> Helping my dad today with some old disks, we realised that in XP Microsoft removed the 720K option from the GUI format tool, and the `/F:720` flag is gone from `FORMAT` on the command line! Fortunately if you specify the tracks and sectors manually it recognises the 720K disk and formats it.
> 
> <pre><code>FORMAT A: /T:80 /N:9</code></pre>
> 
> I don't have any machines with floppy drives running Vista or 7, but I assume this still works in later versions.

I can say now that this was for a legacy SCADA system that didn't support high density floppy disks. It was old for 2010, and even for 2000 now that I think about it. I wonder if it's still running at that plant in Singapore today? It'd likely be more reliable than stuff we have now.

I still use 720K today for my DOS machines, not for any particular reason other than I had a bunch, and they more than fit all my MS-DOS 3.x era stuff.

And yes, according to the [FreeBSD Handbook](https://www.freebsd.org/doc/en_US.ISO8859-1/books/handbook/floppies.html) you can format your floppies with **[fdformat(8)](https://www.freebsd.org/cgi/man.cgi?query=fdformat&sektion=8)** too. **[ufiformat](https://github.com/tedigh/ufiformat)** can be used for USB floppy drives.
