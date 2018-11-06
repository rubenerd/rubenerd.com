---
title: "The new MacBook Air isn’t 2:1 Retina"
date: "2018-11-04T21:21:02+11:00"
abstract: "It’s not the first time Apple did this, but it’s still worrying."
year: "2018"
location: Sydney
category: Hardware
tag:
- apple
- displays
- ergonomics
- macbook-air
- monitors
---
I was doing some more research into the new kit Apple released last week, and came across this worrying FAQ on [Apple Insider]\:

> The 13.3-inch LCD display on the new MacBook Air has a native resolution of 2,560-by-1,600 pixels, with scaled resolutions of 1680 x 1050, 1440 x 900, and 1024 x 640.

This means the MacBook Air doesn't have native 2:1 Retina scaling. It should default to 1280×800, not 1400×900.

It's not the first time Apple has done this, but it's still a worrying trend. Benjamin Mayo summarised the issue for [9to5Mac] when Apple did this on the MacBook Pro recently, emphasis added:

> The images the GPU is creating cannot fit cleanly onto the native display resolution; **they are not integer scalings of the native resolution.**
> 
> macOS cheats a little by squeezing in the images into the screen pixel matrix using algorithm tricks to smooth out the effect. The consequence is that text is not perfectly sharp and things like 1px lines **will never quite fit the pixel grid**. Some UI elements will look a little fuzzy. 

Perhaps they wanted to fudge the Air's resolution to appear higher than it really is; we can only speculate. But the end result is the same: a MacBook Air bought today will have a blurrier screen.

Since the iPhone 4, Apple sought to define Retina as being 2:1 for pixel ratios in the same physical space. So a 2560×1600 display was 2x horizontally and 2x vertically of a 1280×800 display. It makes so much design work simpler, and screens automatically look crisper. Double the resolution of assets, and be done. 

By comparison, Windows 10 and PC manufacturers default to 1.5:1 for high resolution display scaling. That's to be expected for cheap hardware, but not for the calibre and attention to detail Apple is known for. Or at least, used to be.

I hope Apple Insider was wrong, and we get hardware with the correct scaled Retina resolution. Otherwise, it'd be hard for me to recommend buying this machine.

[Apple Insider]: http://appleinsider.com/articles/18/11/01/frequently-asked-questions-about-the-2018-macbook-air "Frequently asked questions about the 2018 MacBook Air"
[9to5Mac]: https://9to5mac.com/2016/12/02/15-inch-macbook-pro-screen-resolution-blurry/

