---
title: "bzip2 and KornShell fun"
date: "2019-05-06T19:03:37+10:00"
abstract: "Follow up on a tweet about bzip [sic] and an unintentional ksh reference! What flavour do you use?"
thumb: "rubenerd.com/files/2019/corny.jpg"
year: "2019"
category: Software
tag:
- apple
- bzip2
- compression
- ksh
- macos
- netbsd
- openbsd
- shells
location: Sydney
---
[I tweeted something to this effect](https://twitter.com/Rubenerd/status/1123232069356642304) a couple of days ago:

    $ bzip something.tar  
    ==> ksh93: bzip: not found [No such file or directory]
    $ echo "GAH! One of these days...!"

I had a couple of people asking for clarification, and one particular eagle-eye cherry tweeter had a question about my choice of shell. So I'm going to tackle both in one post!


### The error

The problem was I mistyped `bzip2`, the ludicrously common \*nix compressor. It's seeing less use now that `xz` doesn't take too long on modern hardware, but you'll likely still encounter it. I have two theories for why I routinely mistype it:

* I almost always do `tar -cjvf` to archive and compress in [one command](https://rubenerd.com/unix-file-compression-basics/ "My blog post from 2010 on *nix file compression basics"), so I'm rarely invoking `bzip2` directly.

* It's close enough to `gzip` that I type it as such.

I'm avoiding just aliasing the problem away, because I'm concerned it'd just cement this incorrect neural pathway. I think I just need to make this mistake enough times to get it through this veritable skull of thickness.


### The shell

Which leads me to the `ksh93` in the error that I completely missed. Yes, that's the latest iteration of the original KornShell by David Korn and contributors. I *sort of* let slip that I was using it as my daily driver back in February, while blogging about [NetBSD HAXM](https://rubenerd.com/qemu-haxm-on-netbsd/):

> Anyone who rocks the KornShell is awesome in my book, too.

I used and loved `tcsh` for most of my \*nix career. It was the default shell back when Mac OS X was awesome, and it's still the most capable shell in FreeBSD base. As I [wrote a decade ago](https://rubenerd.com/p3873/):

> If I need to do some shell scripting I use basic sh, but I always try to use tcsh as my interactive shell whenever possible.

This worked well, but I was also learning more Bourne shell script tricks, and wanted to use them in my interactive shell as well. tcsh would, understandably, bork at my Bourne syntax.

I had experience with the KornShell from NetBSD, so I started using it everywhere. It has Bourne compatibility, with a few interactive niceties. I installed ksh93 and left it at that, but have since learned there are a few offshoots, including the Public Domain `pdksh` and MirOS `mksh` variants.

This week is looking pretty slammed, but I'm going to install a few from ports and do some tinkering. I'd be [keen to hear on Twitter](https://twitter.com/Rubenerd) if you have a preference and why.

