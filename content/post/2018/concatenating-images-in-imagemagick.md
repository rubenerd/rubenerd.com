---
title: "Concatenating images in ImageMagick"
date: "2018-01-02T19:12:11+11:00"
abstract: "There’s a concatenate method, who knew?"
year: "2018"
location: Sydney
category: Software
tag:
- photos
- imagemagick
- guides
- postaday2018
---
*<strong>UPDATE:</strong> I've since been told an [even better way].*

I script as much as possible for *Rubenerd*, including image processing. This is how I've been concatenating images side by side for the longest time:

	$ montage -border 0             \
		-geometry x$_ORIGINALHEIGHT \
		-tile 2x                    \
		$_IMAGE1 $_IMAGE2           \
		out.ext

But there's an easier way!

	$ montage -mode concatenate $_IMAGE1 $_IMG2 $_OUT

I don't have an install to try in GraphicsMagick, but my hunch is its ImageMagick-specific.

More code or lines in your scripts are rewarding, but not half as much as being able to take lines out.

[even better way]: https://rubenerd.com/concat-with-append-in-imagemagick/

