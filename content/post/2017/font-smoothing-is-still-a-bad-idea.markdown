---
draft: true
title: "font-smooting is still a bad idea"
date: "2017-06-13T17:30:00+10:00"
abstract: "Basically, they look like crap"
category: Infocomm
tag:
- design
- fonts
- internet
- typeography
---
[Dmitry Fadeyev] wrote an excellent article on why you shouldn't mess with the font-smooting attribute. Emphasis added:

> Webkit, the engine under the Safari and Chrome browsers, adds an interesting property to CSS called “font-smoothing”. You can probably guess what it does by its name. There are three different values you can use for it. [..]
>
> It’s surprising that even the BBC is doing it on their new site. I think it’s a case of using something just because it’s there, and not really thinking through the reasons behind it. Actually, I can’t find a good reason to use antialiasing right now instead of subpixel rendering. I’m not sure that taste is a good argument for this because what you do get are fonts rendered at lower resolution, which are weaker and less crisp than their subpixel counterparts. **Don’t sacrifice readability for appearance.**

The CSS for the site:

    html {
        -webkit-font-smoothing: antialiased;
        -moz-osx-font-smoothing: grayscale; [..]

Dmitry, noooo! Fortunately, I now know about the proprietary <abbr title="Mozilla">moz://a</abbr> extension I can override in Firefox.

[Dmitry Fadeyev]: http://www.usabilitypost.com/2010/08/26/font-smoothing/

