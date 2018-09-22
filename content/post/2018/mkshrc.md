---
title: "mkshrc"
date: "2018-02-21T20:40:09+11:00"
abstract: "This is the configuration file for the MirOS Korn shell"
year: "2018"
location: Sydney
category: Software
tag:
- shells
- korn-shell
- postaday2018
---
I found a .mkshrc while going through my home directory dotfiles. I couldn't even remember what it was, but it's a [MirOS Korn Shell] configuration file. I didn't know this; on NetBSD I'd used `.kshrc` with [ksh88].

But why did I have it on my Mac?

    # Add RVM to PATH for scripting. Make sure this is the 
    # last PATH variable change.
    export PATH="$PATH:$HOME/.rvm/bin"

That'd do it!

The MirBSD Korn Shell is also the [default on Android], though I won't hold that against it or its delightful name.

[ksh88]: http://netbsd.gw.com/cgi-bin/man-cgi?ksh+.i386
[MirOS Korn Shell]: https://www.mirbsd.org/mksh.htm
[default on Android]: http://www.all-things-android.com/content/mirbsd-korn-shell-android-shell

