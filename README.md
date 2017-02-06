# rubenerd.com

This is the source for *[Rubénerd](https://rubenerd.com)*, a weblog and podcast of esoteric interests by Ruben Schade in s/Singapore/Sydney/ since 2004.


## Dependencies

### Site
* [Git](https://git-scm.com/) – previously svn, forcing myself to learn
* [Hugo](http://gohugo.io) – **fast** static site generator written in Go
* POSIX shell scripts – without \[\[ bashisms \]\], for portability
* BSD sed, awk – tried to be portable, *should* work with GNU
* [rsync](https://rsync.samba.org/), [OpenSSH](http://www.openssh.com/) – for secure ∆ updates, transfers

### Inline images
* [ImageMagick](http://www.imagemagick.org) – for processing images and cover art
* [jpegoptim](https://github.com/tjko/jpegoptim) – lossless [sic] JPEG optimiser
* [pngcrush](http://pmt.sourceforge.net/pngcrush/) – lossless PNG optimiser

### Podcast
* [eyeD3](http://eyed3.nicfit.net/) – ID3 tag parser
* [flac](https://xiph.org/flac/) – for lossless audio archiving
* [internetarchive](https://github.com/jjjake/internetarchive) – Python interface to the Internet Archive
* [lame](http://lame.sourceforge.net/) – mp3 encoder for podcast feed
* [libav](https://libav.org/) – for transcoding
* [Normalize](http://normalize.nongnu.org/) – what the name suggests
* [Sox](http://sox.sourceforge.net/) – for stitching audio

### Previously used
* [GraphicsMagick](http://www.graphicsmagick.org/) – didn't have the layer and SVG alpha features of ImageMagick
* [Jekyll](http://jekyllrb.com) – static site generator, easy to use but slow on thousands of posts
* [Perl](http://perl.org) – my first love, but replaced with shell scripts for portability


## Licence
Blog text, scripts and referenced audio files are dual-licenced under [Creative Commons Attribution 3.0](https://creativecommons.org/licenses/by/3.0/), and the [3-Clause BSD licence](http://opensource.org/licenses/BSD-3-Clause) (the one with the no endorsement clause, which I think is perfectly reasonable).

I retain all copyright over the terrible 1990s graphics and visual design, though feel free to poke apart and learn something from them if useful.

