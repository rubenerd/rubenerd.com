---
title: "Sorting a *nix folder by last modification date"
date: "2018-01-27T10:17:10+11:00"
abstract: "In my continuing series of things you already know, unless you don’t already know"
year: "2018"
category: Software
tag:
- bsd
- freebsd
- netbsd
- linux
- debian
- centos
- fedora
- things-you-already-know-unless-you-dont
- written-in-sydney
---
In my continuing series of [things you already know, unless you don't], this command sorts the contents of a folder by modification date, then lexicographical:

    $ ls -lrt

Nine times out of ten, when I'm browing a folder of logs or assets or anything else, I'm looking at what was last changed. This puts the most recent changes at the bottom, which is useful if the list is longer than my console.

I've long since committed this to muscle memory, like a gentleman, but [at the time] I remembered it by thinking of the [Singaporean] and [Malaysian] trains. You may substitute it with your own mnemonic.

You [won't want to use this in a script], but it's still super useful. Like a banana. And the man pages for [FreeBSD], [NetBSD], [macOS], and [GNU/Linux] will have more details.

[things you already know, unless you don't]: https://rubenerd.com/tag/things-you-already-know-unless-you-dont
[won't want to use this in a script]: https://rubenerd.com/trap-of-using-unix-find-in-ordered-lists/ "Blog post on the pitfalls on using find in ordered lists"
[Singaporean]: https://en.wikipedia.org/wiki/Light_Rail_Transit_(Singapore)
[Malaysian]: https://en.wikipedia.org/wiki/Ampang_and_Sri_Petaling_lines
[at the time]: https://rubenerd.com/modular-xorg-on-netbsd-from-scratch/ "Blog post on installing modular Xorg on NetBSD, from 2007"

[FreeBSD]: https://www.freebsd.org/cgi/man.cgi?query=ls&apropos=0&sektion=0&manpath=FreeBSD+11.1-RELEASE+and+Ports&arch=default&format=html
[NetBSD]: http://netbsd.gw.com/cgi-bin/man-cgi?ls++NetBSD-current
[macOS]: https://developer.apple.com/legacy/library/documentation/Darwin/Reference/ManPages/man1/ls.1.html
[GNU/Linux]: https://linux.die.net/man/1/ls

