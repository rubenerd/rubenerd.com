---
draft: true
title: "Scripting away Rubenerd Show art"
date: "2017-01-29T17:58:00+10:00"
---
Since I rebooted my podcast in 2015, the cover art for each episode has consisted of a posterized four-colour background, a logo from a transparent SVG, and cast in the dominant colour of the source photo.

The GIMP made quick work of this, but it was the same steps every time. I have the uncanny ability to spend more time scripting away tasks than it would have taken to do the work manually, so this weekend I replaced these quick tasks with an ImageMagick script.

### Setting up the tools

I've been a GraphicsMagick user for years. It's cross platform, fast, and I prefer having generic commands like convert sit beneath the gm utility. Unfortunately, either it didn't have the transparency and layering features I needed, or I couldn't find them documented anywhere.

So it was back to ImageMagick. Strangely, the Homebrew version also doesn't support converting SVGs to PNG, but you can build it in:

    $ brew install imagemagick --with-librsvg 

### Creating the background image

I wanted the script to take three parameters: the source background photo, the logo as a transparent SVG (converted to PNG), and the episode. So the first step was taking a source image ($_SOURCE), scaling it down to the target size, and cropping the excess.

You can check the width and height of images with identify. The order of the parameters and filename are critical, otherwise you get junk:

    _WIDTH=`identify -ping -format "%w" "$_SOURCE"`
    _HEIGHT=`identify -ping -format "%h" "$_SOURCE"`

Then scale the image so its shortest dimension (height or width) is equal to the cover size, with the other scaled to maintain the same aspect ratio. If you scale the longest dimension, the other will be scaled down too small.

    if [ $_WIDTH -gt $_HEIGHT ]; then
        convert "$_SOURCE" -resize x640 "$_OUT.png"
    else
        convert "$_SOURCE" -resize 640x "$_OUT.png"
    fi

Then crop the image to a square. The gravity center parameter trims the excess from the sides, otherwise it'd go from the left:

    convert "$_OUT"         \
        -gravity Center     \
        -crop 640x640+0+0!  \
        "$_OUT.png"

### Creating a colour mask

These covers are cast in the dominant colour of the original image. There are so many ways to find which colour this should be, including exporting histogram data, doing calculations, and spinning chickens around your head.

I took the simple way out, and resized the image down to a single pixel. Admittedly, this mixes all the colours down into a single one instead, but it works just fine for my needs.

    convert "$_SOURCE"         \
        -normalize             \
        -modulate 100,255,100  \
        -resize 1x1!           \
        -resize 640x640!       \
        "$_COLOUR"

Unsurprisingly, the downside to this approach was the resulting colour always appeared muddier or less vivid than the original image, so I cheated again and normliased and bumped up the contrast first.

### Overlay colour mask

This is what lead me to use ImageMagick instead of GraphicsMagick, and even then I was scouring documentation, forums and stackoverflow sites for hours trying to figure out how to do this. All I wanted was the equivilent of The Gimp's Color Layer filter.

The closest I came was reducing the colours down to 4 to achieve that retro look, converting to grayscale, adding the colour mask from before, setting compsee to overlay, and exporting. The order, and specific values for each of these took a ton of trial and error, but it now works: 

    convert "$_OUT"       \
        -posterize 4      \
        -colorspace gray  \
        "$_COLOUR"        \
        -compose overlay  \
        -composite        \
        "$_OUT"

### Overlay the logo

Now I can add the logo, which is a transparent SVG. To convert it to a PNG first, use the background parameter otherwise you get a solid background. You need to have compiled in rsvg support, as shown above.

    convert logo.svg -background none logo.png

Then add the image as a layer, flatten it, and do the same colour cast as before.

    convert "$_OUT"       \
        +page "$_LOGO"    \
        -flatten          \
        -colorspace gray  \
        "$_COLOUR"        \
        -compose overlay  \
        -composite        \
        "$_OUT"

### And we're done

Could this have been refactored to hit the disk less? Could some of these converts be merged into fewer ones? Probably, but this works, and despite simple appearances this was a real shitfight to get right.

I'm just happy this is one less manual process I have to do now. All I need are automatic show notes, and everything from encoding, tagging, art generation, uploading, blog posting and RSS feeds would be automatic immediately after recording a show.

