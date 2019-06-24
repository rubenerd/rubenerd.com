---
title: "Cropping a single row of pixels with ImageMagick"
date: "2019-06-05T22:11:48+10:00"
abstract: "You want -chop, NOT -crop! And thanks to kwm@ and adam@ for maintaining the BSD ports of this great software."
year: "2019"
category: Software
tag:
- bsd
- freebsd
- graphics
- guides
- imagemagick
- photos
location: Sydney
---
I can never remember the syntax for cropping a single row of pixels using ImageMagick, hence the title of the post where I elude to the fact I want to crop a single row of pixels with ImageMagick.

For a row:

    $ magick convert $INPUT -chop 0x1 +repage $OUTPUT

For a column:

    $ magick convert $INPUT -chop 1x0 +repage $OUTPUT

I probably keep forgetting because I want `-crop`, not `-chop`.

While I'm here, thanks to the ImageMagick team for their amazing toolkit, and kwm@ and adam@ for maintaining the [FreeBSD Port](https://www.freshports.org/search.php?query=imagemagick) and [pkgsrc packages](http://pkgsrc.se/graphics/ImageMagick)!
