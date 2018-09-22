---
title: "Concatenating with append in ImageMagick"
date: "2018-02-03T11:39:03+11:00"
abstract: "Thanks to @ozzmosis, I like this approach even more."
year: "2018"
location: Sydney
category: Software
tag:
- photos
- media
- imagemagick
---
Last Tuesday I mentioned the way I use ImageMagick to [concatenate images]. The [@ozzmosis shared] an alternative:

    convert 01.png 02.png +append out.png

And for vertical concatenation:

    convert 01.png 02.png -append out.png

I like these approaches even more. Thanks!

[concatenate images]: https://rubenerd.com/concatenating-images-in-imagemagick/
[@ozzmosis shared]: https://twitter.com/zoomosis/status/958900795478388736

