---
title: "The ASUS EeeBook X205TA"
date: "2016-08-09T15:49:00+10:00"
year: "2016"
location: Sydney
category: Hardware
tag:
- asus
- laptops
- intel-atom
- notebooks
---
I'm still a Mac desktop user, but I've been looking at PC laptops again. For remotely fixing servers, I've resigned myself to the fact I have to carry a laptop around with me permanently, so I want the lightest one I can get.

I don't care about screen quality, just the ability to run FreeBSD or Debian with a tiled window manager, several xterms and a real serial port. Okay, that last one is a joke. Almost (cries quietly). I'd even almost eschew (gesundheit) an xorg session to just run a widescreen dvtm in ncurses.

<p><img src="https://rubenerd.com/files/2016/asus-lettersoup-laptop.jpg" srcset="https://rubenerd.com/files/2016/asus-lettersoup-laptop.jpg 1x, https://rubenerd.com/files/2016/asus-lettersoup-laptop@2x.jpg 2x" alt="" style="width:500px; height:250px;" /></p>

So when I saw this ad for the ASUS EeeBook X205TA (rolls of the tongue, doesn't it?) for AU$299, I was intruiged:

> Quad Core. 2GB of RAM. 32GB storage. Windows 8.1

A "Quad Core" what though? I went to the [features section] of the ASUS website:

> Quad-core processor for smooth multitasking performance
>
> ASUS EeeBook X205 features an Intel quad-core processor that has the power to handle all your daily computing needs.

A "quad-core" what though? At this stage I'm hoping it's something exotic, like a SPARC64 or POWER. Let's check their [specifications section]:

> Intel® Bay Trail-T Quad Core Z3735 1.33 GHz Processor

Alas, no Sparkie. But still the question remains unanswered: what CPU is this? What processor family does it belong to? By now, I already know what its probably going to be, given the manufacter wouldn't obfuscate a good CPU like this. But let's check out the ever-faithful [Arc]:

> Family: Intel® Atom™ Processor for Smartphone and Tablet  
> Release: Q1'14  
> Launch Date: Q1'14  
> \# of Cores: 4  
> Processor Graphics: Intel® HD Graphics

Of course, there isn't one Z3735, there are four with different minor letter versions. Which one Asus used here is a mystery, but at least we know it's an Atom.

For Linux support, I haven't held out much hope for Linux support on Atom since buying a Lenovo IdeaPad S300, realising it couldn't boot without terrible 32bit hacks, and getting rid of it.

[features section]: https://www.asus.com/au/Notebooks/ASUS_EeeBook_X205TA/
[specifications section]: https://www.asus.com/au/Notebooks/ASUS_EeeBook_X205TA/specifications/
[Arc]: http://ark.intel.com/search?q=Z3735

