---
title: "Please don’t use fixed-position navigation bars"
date: "2019-09-11T17:37:15+10:00"
abstract: "It’s annoying, but more importantly, it’s an accessibility concern."
year: "2019"
category: Internet
tag:
- dickbars
- design
- regressive-web-design
location: Sydney
---
I haven't hidden my distaste for what I dub *regressive web design*. Auto-playing and looping background videos, hamburger icons, newsletter prompts, chat bots; they're the pop-up windows and `<MARQUE>` elements of the 2010s, with all the hard-fought lessons we learned from the late 1990s thrown out the proverbial airlock, gasping for air like me when I started going to the gym. There's a mental image we all didn't need.

And speaking of things we don't need, the other of these regressive trends is [fixed-positioned navigation](https://rubenerd.com/more-regressive-web-design-stickyness/) and social media links, which I raised in March last year:

> The good news is all of these elements use fixed positioning, so its easy enough to target them with a toolbar bookmarklet like [Kill Sticky Headers](https://alisdair.mcdiarmid.org/kill-sticky-headers/). If you fixed position anything in your CSS, I’d wager you it’d be greatly improved if you didn’t. 

This hit a nerve on Twitter at the time. People angry on Twitter, *really?!* Much of the pushback were either from trolls, or web designers who listed off workarounds without addressing the core problem, as all of us in IT are want to do. But a few, in good faith, wanted to know *why* some of us don't like persistent elements on our screens.

It's nothing groundbreaking: it messes with your effective viewport. You see less information because you're viewing the site through a smaller window; which especially sucks on mobile. On the desktop, it breaks Page Up, Page Down, and Spacebar for scrolling, and adds needless visual clutter.

But these concerns pale in comparison to what the real problem is with this stuff, as [Amy Carney tweeted](https://twitter.com/click2carney/status/1170728170342907904) last Sunday:

> Please, please, PLEASE, stop designing sticky headers & footers #WebDev. Your trick leaves us, who need to increase text size or zoom in, with only a few lines to read at a time. It's just as annoying as ads that monopolize the screen. -Sincerely, the visually impaired. #a11y

Now, just as fast food instantly becomes gourmet upon shoving caviar and gold leaf on it, you can carefully code fixed-position navigation to behave better, be less annoying, and more accessible. But the best approach is to remove them.

