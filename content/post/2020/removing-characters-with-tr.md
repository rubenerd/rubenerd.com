---
title: "Removing characters with tr"
date: "2020-03-06T08:05:28+11:00"
abstract: "Use -d."
year: "2020"
category: Software
tag:
- bsd
- freebsd
- illumos
- linux
- netbsd
- opensolaris
- solaris
- things-you-already-know-unless-you-dont
location: Sydney
---
In our continuing series of [things you already know unless you don't](https://rubenerd.com/tag/things-you-already-know-unless-you-dont/), today we're looking at removing characters with the `tr` command.

`tr` is used to *translate*, or subtitute characters in a string. In its simpliest invocation:

    $ printf "%s\n" "hXllo" | tr 'X' 'e'
    ==> hello

But what if you want to just remove `X`? The temptation is to supply an empty second argument:

    $ printf "%s\n" "hXello" | tr 'X' ''
    ==> tr: empty string2

So admittedly I'd been using `sed` for that. This will match on every occurance of a string and replace it, which can also be a single character:
    
    $ sed 's/X//g'

But I've since learned there's a `-d` option:

    $ tr -d 'X'

From the FreeBSD [manpage(1)](https://www.freebsd.org/cgi/man.cgi?query=tr&sektion=1):

> -d Delete characters in string1 from the input.

Done!

