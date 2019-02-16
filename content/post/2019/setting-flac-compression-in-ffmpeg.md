---
title: "Setting FLAC compression in FFmpeg"
date: "2019-01-15T21:43:59+11:00"
abstract: "Using the -compression_level option"
year: "2019"
category: Software
tag:
- audio
- flac
location: sydney
---
The Free Lossless Audio Codec is supremely useful for archiving audio. You can compress audio using the [flac tool], surprising though it may seem. This will compress it to the best size:

    $ flac --best $SOURCE

But what if it can't read the source? I'm trying really hard to avoid making one of my bad Tabasco puns I would have worked *to death* even a couple of years ago.

I previously batch-processed audio to aiff or wav first before feeding them in, before realising [FFmpeg] can transcode to flac in one step. And today I learned you can set an equivalent compression level:

    $ ffmpeg -i $SOURCE -q:a flac -compression_level 12 $OUT.flac

I haven't tested this on [avconv], but I assume the same command would work.

[flac tool]: https://xiph.org/flac/
[FFmpeg]: https://ffmpeg.org/
[avconv]: https://libav.org/avconv.html

