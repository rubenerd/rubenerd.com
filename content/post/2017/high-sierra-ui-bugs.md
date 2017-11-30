---
title: "MacOS High Sierra UI bugs"
date: "2017-11-12T11:20:25+11:00"
abstract: "There are enough of these things to make me want to downgrade!"
category: Software
tag:
- apple
- macos
- mac-os-x
- os-x
- design
- bugs
---
I've been running High Sierra for a few days now, and there are several niggling UI bugs that make me want to do something with the business end of an umbrella and a staircase.

### Calling it macOS

Not happening, for the same reasons these Wikipedians rejected the idea of renaming the [Mac Mini] article to Mac mini:

> Oppose. As explained at Wikipedia:Manual of Style (trademarks), we use "the style that most closely resembles standard English, regardless of the preference of the trademark owner." As a proper noun, "Mac Mini" is standard English. We note Apple's nonstandard preference in the lead. —David Levy 01:58, 16 June 2010 (UTC)
>
> Oppose. David Levy is exactly right; the name of a product is a proper noun and should be capitalized. Corporations may bend the rules of English to help distinguish their brand, but there is no reason everyone else has to go along with it. Fletcher (talk) 03:17, 16 June 2010 (UTC)

Fletcher did say "capitalized", but I suppose we can forgive him given this is an American company. Mr Ive would do well to enforce the correct spelling of aluminium by his colleagues though, given he's already most of the way there pronouncing it.

### Menubar shadows

I've noticed that in some applications, the gradient for the menubar starts a pixel higher. The effect is a double width border for windows against the menubar.

<p><img src="https://rubenerd.com/files/2017/hs-menubar@2x.png" alt="" style="width:500px; height:180px;" />

### Application icon inconsistency

The *Mac App Store* now has a stylised A that bares no relation to applications beyond starting with the first letter. It's a lazy design trend even hipster software like *Slack* falls victim too, though at least they have the excuse that their typography is terrible in their software too.

By comparison, everything else still uses the original pencil, ruler, and paintbrush A, including the *Applications* folder, *Xcode*, and sidebar icons.

<p><img src="https://rubenerd.com/files/2017/hs-apps@2x.png" alt="" style="width:500px; height:180px;" />

### Finder toolbar spacing inconsistency

This one I feel Apple does on purpose just to goad me. With each release of Mac OS X, the UI designers tweak the margins of the Finder toolbar icons for no reason. *Leopard* had the buttons floating around without any reference to the sidebar margins at all, which they fixed in *Snow Leopard*.

*Sierra* had consistent spacing between icons, but now in *High Sierra* they're all over the place again. I removed all spacer elements, and there's no rhyme or reason to their alignment or spacing. Yuck!

It begs the question, why change these at all? They're otherwise the **exact same** toolbar buttons in Sierra.

<p><img src="https://rubenerd.com/files/2017/hs-menubar-finder@2x.png" alt="Screenshot showing the inconsistent spacing between toolbar icons" style="width:500px; height:180px;" />

I wouldn't make a mockery of those who have OCD by pretending to have it myself, but I'm this close to wiping this off to rid myself of these frustrating things.

[Mac Mini]: https://en.wikipedia.org/wiki/Mac_Mini
