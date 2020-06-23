---
title: "pngcrush’s loco crush option"
date: "2020-06-08T16:46:47+10:00"
abstract: "It generates MNG files, not PNGs. Today I learned."
thumb: "https://rubenerd.com/files/2020/pngbar@2x.png"
year: "2020"
category: Software
tag:
- graphics
- optimisation
- pngcrush
location: Sydney
---
Every PNG image on this blog goes through [ImageMagick] to create [srcset] versions, then [pngcrush] to losslessly optimise them. The savings are routinely upwards of 40% for the same visuals, or 40pc if I go by some bizarre modern style guides.

I was reviewing my dotfile aliases, like a gentleman, and noticed pngcrush had an option I hadn't noticed before:

    -loco ("loco crush" truecolor PNGs)

From the [help file]\:

> Make the file more compressible by performing a lossless, reversible, color transformation. The resulting file is a MNG, not a PNG, and should  be given the ".mng" file extension. The "loco" option has no effect on grayscale or indexed-color PNG files.

I thought it may have been a neural network trained on locomotives. *Trained* on *locomotives?* That was some top-shelf humour.

<p><img src="https://rubenerd.com/files/2020/pngbar@1x.png" srcset="https://rubenerd.com/files/2020/pngbar@1x.png 1x, https://rubenerd.com/files/2020/pngbar@2x.png 2x" alt="Portable Network Graphics Now!" style="width:88px; height:31px;" /></p>

[help file]: https://sourceforge.net/projects/pmt/files/pngcrush/1.8.13/pngcrush-1.8.13-HELP.txt/download
[ImageMagick]: https://imagemagick.org/index.php
[pngcrush]: https://pmt.sourceforge.io/pngcrush/
[srcset]: https://developer.mozilla.org/en-US/docs/Web/API/HTMLImageElement/srcset
