---
title: "Our current software and web slump"
date: "2020-08-10T08:15:39+10:00"
abstract: "Catalyst, Electron, and the modern web are all trending the opposite direction to what we need, and should want."
year: "2020"
category: Software
tag:
- accessibility
- apple
- catalyst
- design
- energy
- macos
location: Sydney
---
Marco Arment shared [this article by Craig Mod](https://craigmod.com/essays/software_slump/) back in June on the decline of desktop software and websites. Much of it was spend discussing the iPad for which I don't have interest, but he absolutely hit the nail on the proverbial head with his other points.

### On Catalyst

> For arguments against Mac Catalyst, Apple’s cross-platform iOS / macOS framework, see the Twitter application. A small sample of issues (which may seem like nits but these details are important!):
> 
> * choppy scrolling / scrolling at a rate different than the rest of the system
> * window resizing blanks out all content
> * elements like the “home” button stay highlighted (as if tabbed to) for no apparent reason
> 
> Most worrying: Catalyst may normalize a lack of craft and refinement. It’s important to remember that we had a solidly native-feeling Twitter client for macOS ten years ago. So this software problem was once solved, unsolved, and now re-solved in a worse way.

Oh Catalyst. You seemed inevitable, but we all pretended it wouldn't be, for that small hope that it wouldn't prevail!

You'd have thought people's apathy for desktop Java, and Microsoft's failed attempts with Metro would be cautionary enough tales against this. The only limited success I can think of here is the Chromebook, but its use cases is more constrained than the goals Apple have here. We can only hope it will continue to be refined over time.

### On Electron

> Electron makes it easier to develop cross-platform applications, but comes at the expense of an application feeling or functioning in a way you’d expect a native application to function. Almost always, these Electron applications are slower and more cumbersome than a native version.

I can understand why so many anti-patterns and poor design decisions exist online and on our desktops, but Electron is one of the few that makes me *angry*. This sorry excuse for a framework has done more to negate the last decade of accessibility progress, hardware efficiency gains, and battery improvements than any tech I can think of. Clara's colleagues had them switch to Visual Studio Code from Sublime Text, and I can hear the pangs of frustration from here; to say nothing of the multiple chat clients we all have to run all day now too.

I understand the appeal for indie developers, but these are multi-billion dollar, listed companies choosing to producing these <del>dumpster</del> battery fires. So we should choose to avoid them where we can.

### On the web in general

> Twitter’s web site now loads (regardless of browser or operating system) in so many various layers and stages I never know if my internet connection is functioning properly or not. Twitter.com’s strange complexities also bring with it the ignoble award of being the only site to regularly crash Safari on my iPhone.
> 
> Newspaper sites deliver hundred megabyte or greater payloads filled with ad tech. Open nytimes.com in a Chrome tab and you’ll soon deplete a fresh MacBook battery.

I'm amazed at how many hundred&mdash;yes, hundred&mdash;elements that plugins like uBlock Origin block on source pages. This is one more argument for RSS readers and open APIs. If the modern web continues to slip into this, we can at least avoid directly interacting with it.


### Conclusions

These issues all stem from a fundamental misalignment of priorities, and until we address them, nothing will change. We need to reward developers who write good software, and have nothing short of a rethink about how people are compensated online. Everything else we do will just kick the proverbial can down the road. That's the third use of *proverbial* in this post, this sentence included.
