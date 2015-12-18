# rubenerd-com

This is the source for *[Rubénerd](http://rubenerd.com)*, a weblog and podcast of esoteric interests by Ruben Schade in s/Singapore/Sydney/ since 2004.

Posts are written in ~~joe~~ ~~TextMate~~ Vim in OS X and FreeBSD, and hosted on a clean nginx stack in a ~~VPS~~ cloud instance in Sydney.

---- 

## Dependencies

### Site
* [Git](https://git-scm.com/) – previously svn, forcing myself to learn
* [Hugo](http://gohugo.io) 0.14 or above – the beautiful static site generator written in Go
* Bourne compatible shell – portable, without \[\[ bashisms \]\], for BSD
* BSD sed, awk – tried to be portable, should work with GNU
* [rsync](https://rsync.samba.org/), [OpenSSH](http://www.openssh.com/) – for secure ∆ updates, transfers

### Podcast
* [eyeD3](http://eyed3.nicfit.net/) - ID3 tag parser
* [ffmpeg](http://ffmpeg.org/) - decoder for m4a files from handheld recorder
* [lame](http://lame.sourceforge.net/) - final mp3 encoder
* [Normalize](http://normalize.nongnu.org/) - what the name suggests
* [Sox](http://sox.sourceforge.net/) - for stitching audio

### Previously used
* [Jekyll](http://jekyllrb.com) – static site generator, easy to use but slow on 4000+ posts
* [Perl](http://perl.org) – my first love, but replaced with shell scripts for portability

---- 

## Licence
Blog text, scripts and referenced audio files are dual-licenced under [Creative Commons Attribution 3.0](https://creativecommons.org/licenses/by/3.0/), and the [3-Clause BSD licence](http://opensource.org/licenses/BSD-3-Clause) (the one with the no endorsement clause, which I think is perfectly reasonable).

I retain all copyright over the terrible 90s graphics and visual design, though feel free to poke apart and learn something from them if useful.

