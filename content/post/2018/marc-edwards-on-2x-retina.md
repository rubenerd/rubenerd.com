---
title: "Marc Edwards on 2x Retina"
date: "2018-11-30T17:25:03+11:00"
abstract: "Complete with an animated GIF, pronounced GIF."
year: "2018"
location: Sydney
category: Hardware
tag:
- accessibility
- apple
- displays
- retina
---
Earlier this month I [lamented the direction Apple was taking] with their Retina displays in two areas:

1. Modern Mac laptops don't default to 2× scaling for Retina anymore, presumably to fudge a higher perceived resolutions.

2. The new MacBook Air physically can't be set to 2× Retina.

[Marc Edwards succinctly explains] why setting your Retina Mac display to anything other than 2× is a Bad Idea&trade;:

> The Display pane in System Preferences includes "larger text" and "more space" options. These can be used as a solution, but if you do, macOS will render the entire screen to a virtual canvas, then bitmap scale it up or down to the desired size. The result is blurry pixels, higher memory usage, more work for the GPU to do, and shorter battery life for laptops. You want to use the "default for this display" setting, if you can. It's better quality, faster, and gives longer battery life.

He also included [this handy GIF] that illustrates the shimmering you get when running at non-2× scaling, for those who are still unconvinced.

[this handy GIF]: https://bjango.com/images/articles/macexternaldisplays/shimmer.gif
[Marc Edwards succinctly explains]: https://bjango.com/articles/macexternaldisplays/
[lamented the direction Apple was taking]: https://rubenerd.com/new-macbook-air-isnt-2-to-1-retina/
