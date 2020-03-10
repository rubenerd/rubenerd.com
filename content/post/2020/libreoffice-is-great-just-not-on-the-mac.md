---
title: "LibreOffice is great; just not on the Mac"
date: "2020-01-30T18:58:29+11:00"
abstract: "The continual performance issues unfortunately mean I can’t recommend for Mac users."
thumb: "https://rubenerd.com/files/2020/libreoffice-cpu.png"
year: "2020"
category: Software
tag:
- libreoffice
- openoffice
- performance
location: Sydney
---
*Update 2020-03: [Version 6.4.2.1 has fixed](https://rubenerd.com/libreoffice-6-4-2-1-fixes-macos-text-regression/) the blurry text and performance issues below. Text is still pixel-doubled rather than using the Mac's native Retina screen resolution, but it's otherwise significantly improved. Special thanks to Christian Lohmaier for tracking this and finding the issue with Xcode that caused this.*

LibreOffice is solid software, and the Document Foundation have done a great job maintaing and fostering its development. I've been using it since its StarOffice days, then later OOo. I've so internalised how it works that Microsoft Office feels clunky and unintuitive by comparison; a comment that garners a mix of disbelief and bemusement on the part of Office people. It's their loss; the Sidebar UI alone is worth trying given how much more elegant it is compared to the Office Ribbon. I use it on my [FreeBSD machines](https://www.freshports.org/editors/libreoffice-en_GB/) now, thanks to the efforts of the office@ ports team.

I mention all this to provide context for what's about to come. <del>LibreOffice on the Mac is unfit for purpose</del> [ed: see update above] as much as it pains me to say. It has been since at least 2017, and it's been getting worse.

Credit where credit's due, the software was properly ported to use native Quartz as opposed to spawning an Xorg session. It uses native Mac Open and Save dialog boxes. It integrates well with system printers. All of this would have taken a lot of work which, given the install base of macOS and the smugness of many of its users against free/open source GUI applications, was much appreciated.

But performance is where it falls apart. These are but a few of the most frustrating examples:

* Scrolling speed is slow, jittery, unpredictable, and easy to overshoot. Lotus 1-2-3 running on my vintage 200MHz Pentium tower next to me scrolls a thousand line spreadsheet more accurately and smoothly, and stops when I lift my finger off the cursor keys. The worst is when it buffers your input, leading you to watch in vain as your document or spreadsheet cells fly away long after you stopped scrolling.

* Typing responsiveness is poor. Characters that appear immediately when I type them in other applications have a noticeable lag, especially in Writer where you're more likely to do long form text input. It's even worse than typing in an Electron "desktop" application.

* Placing, moving, resizing, and connecting shapes in Draw is an exercise in futility. The movements lack any precision, leading to vague placement, dropping things where you don't intend to, and clicking through things you didn't expect. Once you throw in line connections, layers, and fatigue, you want to start flipping tables. 

Opening `top` or Activity Monitor immediately shows the issue. Any scrolling or movement results in an entire core being pegged, where it'll happily stay until you stop moving around the document you're in.

<figure><p><img src="https://rubenerd.com/files/2020/libreoffice-cpu.png" alt="Screenshot of Activity Monitor showing LibreOffice using 99.4% CPU" style="width:500px; height:150px;" /></p></figure>

Eagle-eyed readers may have just noticed what my problem is. The screenshot is from a Retina Mac, Apple's term for Hi-DPI displays. Run even the most recent LibreOffice on a non-Retina Mac, or use a Retina MacBook in clamshell mode with a non-Retina screen, and the performance problems go away. For whatever reason, LibreOffice and Retina Macs simply don't work.

Which leads us to the suggested solutions. Forums say to reset your user profile, which has never worked. Others say you should offload to the discrete GPU, which your laptop might not have, or you don't want to given the huge power penalty this will incur.

The only tolerable workaround is to launch LibreOffice using Low Resolution Mode:

1. Click on *LibreOffice.app* in */Applications* 
2. Hit `CMD+I` to launch *Get Info...*
3. Check *Low Resolution Mode*

But even then, this has got worse. Whereas before text would just double in pixel size, now text and lines [appear blurry and ill-defined](https://ask.libreoffice.org/en/question/205141/blurry-fonts-on-version-630-what-can-i-do/), like you're looking at a document through watery eyes. This was introduced after LibreOffice 6.2.x, which I've since reverted to. Version 6.4 released yesterday was billed as a [performance-focused upgrade](https://blog.documentfoundation.org/blog/2020/01/29/libreoffice-6-4/), but it made no discernable difference to either Mac performance or font rendering.

I'm not a C++ developer, but I'm willing to help financially to solve this problem. Because until this is resolved, I can't recommend LibreOffice for Mac users.

These are the relevant bug reports:

* [113104: MacOS: CPU utilization while scrolling through a plain text document is around 90% on Retina HiDPI screens](https://bugs.documentfoundation.org/show_bug.cgi?id=113104)
* [120727: Excessive CPU usage under normal use (typing)](https://bugs.documentfoundation.org/show_bug.cgi?id=120727#c3])
* [122218: After Update to 6.1.4 on macOS fonts are blurred on retina display](https://bugs.documentfoundation.org/show_bug.cgi?id=122218)
* [123283: Libreoffice 6.2 slow scrolling mac retina](https://bugs.documentfoundation.org/show_bug.cgi?id=123283)
* [127020: Fonts are blurry on MacOS Retina displays](https://bugs.documentfoundation.org/show_bug.cgi?id=127020)

