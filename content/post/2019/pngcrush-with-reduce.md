---
title: "pngcrush with reduce"
date: "2019-03-16T09:43:30+11:00"
abstract: "I’ve been using this for years but didn't know of this argument."
year: "2019"
category: Software
tag:
- images
- png
- pngcrush
location: Sydney
---
Every PNG image on *Rubenerd*, and every screenshot in documentation I write, gets run through [pngcrush]. It losslessly removes data and optimises the resulting image, often by a shocking amount. Today I learned there's another flag you can use:

    -reduce (do lossless color-type or bit-depth reduction)

This inks out even more space, especially on images that have a very limited palette. The caveat here is you'd potentially want to save it back as a full depth image before editing, or operations like resizes will look jagged and gross.

So now my standard is reduce the size, don't update the file timestamp, overwrite the original, and work with broken images if possible:

    $ pngcrush -reduce -oldtimestamp -ow -fix

I haven't run into problems using `-ow`, but you may want to eschew (gesundheit) that option and save a second image if you want to be cautious. You can use `-brute`, but it takes sufficiently longer without any discernible benefit for me to bother.

It's available from [Homebrew], [MacPorts], [FreeBSD ports], and [pkgsrc].

[pngcrush]: https://pmt.sourceforge.io/pngcrush/ "Official pngcrush homepage"
[Homebrew]: https://formulae.brew.sh/formula/pngcrush#default
[MacPorts]: https://github.com/macports/macports-ports/blob/master/graphics/pngcrush/Portfile
[FreeBSD ports]: https://www.freshports.org/graphics/pngcrush/
[pkgsrc]: http://pkgsrc.se/graphics/pngcrush

