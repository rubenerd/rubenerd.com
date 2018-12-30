---
title: "Converting down PNGs to 256 greys"
date: "2014-12-16T08:41:00+11:00"
abstract: "This originally appeared on the Annexe."
year: "2014"
category: Annexe
tag:
- imagemagick
- rinne-no-lagrange
- graphicsmagic
- written-in-sydney
---
*This originally appeared on the Annexe.*

<p><img src="https://rubenerd.com/files/museum/imagemagick-8bit-test-rnl@1x.png" srcset="https://rubenerd.com/files/museum/imagemagick-8bit-test-rnl@1x.png 1x, https://rubenerd.com/files/museum/imagemagick-8bit-test-rnl@2x.png 2x" alt="" style="width:500px; height:312px" /></p>

Using ImageMagick:

    convert -type grayscale -depth 8

Using GraphicsMagick:
    
    gm convert -type grayscale -depth 8

