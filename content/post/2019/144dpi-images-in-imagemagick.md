---
title: "144dpi images in ImageMagick"
date: "2019-02-18T08:51:24+11:00"
abstract: "For Retina/HiDPI image assets."
year: "2019"
category: Software
tag:
- graphics
- imagemagick
- photos
location: sydney
---
The `srcset` HTML5 attribute that delivers images based on display DPI is so brilliant and elegant, it finally convinced me to move off the otherwise-superior XHTML+RDFa a few years ago. Here's the syntax with two resolutions:

    <img src="$NORMAL" srcset="$NORMAL 1x, $RETINA 2x"
        alt="Caption" style="width:$NORMAL-WIDTH" />

*(I've moved to Markdown for most of my editing, but I generate this code myself. Markdown deliberately has no provision to specify image widths or alternative versions, so the output will always look awful now, unless you use site-wide CSS that doesn't carry through to RSS).*

To feed into this, I convert each image bound for this blog into a Retina/HiDPI; version, and a regular version. Presumably I'll eventually have to do 3x as well.

This is how I create the Retina images in ImageMagick with 144dpi. This should work with GraphicsMagick as well, but I haven't tested:

    $ magick convert "file.ext" \ 
        -units PixelsPerInch    \
        -resample 144           \
        -resize 1000x           \
        "file@2x.ext"

Note the option order; ImageMagick chains these so changing the order will result in different output. Most images also start at 72dpi by default, so the smaller size can usually be accomplished with just a `-resize`.

The irony isn't lost on me that a post about images doesn't include one. Pretend I've inserted a work of visual brilliance here to demonstrate.

