---
title: "Tutorial sites treating FreeBSD like a Linux distro"
date: "2020-07-08T09:24:12+10:00"
abstract: "This used to grate, but I think they need to be reframed."
thumb: "https://rubenerd.com/files/2020/usebsd-pillow@1x.jpg"
year: "2020"
category: Software
tag:
- bsd
- freebsd
- guides
- linux
location: Sydney
---
On the Gold Coast in January, Deb Goodkin from the FreeBSD Foundation began her Linux.conf.au talk with an intentionally-provocative slide: *FreeBSD, that's just another Linux distro, right?* It was said in jest to highlight what a common misconception it is.

One way this manifests is through introductory FreeBSD guides online, usually on blogs with the words sysadmin, cookbook, or tutorial in their names; you know the ones I'm talking about. Invariably they advise updating the base system and pkgng, then immediately installing bash, nano, htop, lsof, coreutils, proc, and more. Some go as far as aliasing these over the built-in tools, and even setting bash as the root shell. From then on, you barely have to touch the FreeBSD userland.

Like a poorly-maintained cheese utensil, this used to grate. If you're installing an entire GNU toolchain, why not use a Linux distribution, or Debian/kFreeBSD, or a Nexenta-like OS that's built specifically for those tools? You're not learning about FreeBSD's features, nor are you taking advantage of any of its benefits beyond the kernel and base. It's wasted opportunity, and could render future project contributions more difficult because of misunderstood assumptions about how the system works.

<p><img src="https://rubenerd.com/files/2020/usebsd-pillow@1x.jpg" srcset="https://rubenerd.com/files/2020/usebsd-pillow@1x.jpg 1x, https://rubenerd.com/files/2020/usebsd-pillow@2x.jpg 2x" alt="A photo of a pillow saying: Use BSD" style="width:192px; float:right; margin:0 0 1em 2em;" /></p>

I've since changed my tune somewhat, with a caveat. I also want to take this opportunity&mdash; not a sponsor&mdash;to spruik Jay Patel's [RedBubble store](https://www.redbubble.com/people/jaypatelani/shop) for your BSD laptop and loungeroom. I've already added some to next sticker batch.

What was I talking about?

We should be encouraging Linux people to try FreeBSD, and if giving them their familiar tooling gets their foot in the door, it's worth it. I personally learn things the quickest by jumping in the deep end, but I know others want to take things a step at a time. 

What also gets lost in the fray is FreeBSD, even with all those Linux-focused tools, is still a compelling and useful operating system. It's a feature not a bug to be able to have all these tools available, and at times run them faster than Linux could on the same hardware. It may even integrate better into shops that otherwise entirely run Linux, given the motivation to write portable, POSIX-compliant code and applications is no longer a priority for most people (sadface).

So rather than saying those guides aren't useful or even misrepresent FreeBSD, we need to reframe them. Instead of *introductions to FreeBSD*, say they're *FreeBSD for Linux people*. This shouldn't be constued as criticism; the latter kinds of post would be *hugely* useful. It's also then easier to introduce BSD-specific tools and ideas, either inline after each Linuxism you introduce, or in a follow-up post where you compare and contrast.

We need more bridge-building and outreach between the two communities, and anything to make FreeBSD relatable to people coming from Linux, or any other operating system, is useful.

