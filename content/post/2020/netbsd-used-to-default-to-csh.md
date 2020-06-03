---
title: "NetBSD used to default to csh"
date: "2020-05-29T21:20:04+10:00"
abstract: "It makes sense, but I never thought about it"
thumb: "https://rubenerd.com/files/2020/netbsd@2x.png"
year: "2020"
category: Software
tag:
- bsd
- csh
- netbsd
- shells
- tcsh
location: Sydney
---
I suppose it makes sense, but I [never thought about it](https://www.netbsd.org/docs/misc/index.html)\:

> csh(1) ('C' shell): This was the standard user shell until NetBSD 4.0, it supports filename completion ('set filec' and use the ESCAPE key) but does not support command line editing.

Some of my machines had NetBSD prior to version 4, but at the time I didn't really understand the difference between all the different \*nix shells one could use. All I knew was my professor telling me to use ksh so I could get command line history and tab completion... but then, didn't csh do some of this?

I got pretty good at tcsh from using FreeBSD and early releases of macOS, and can still recite the set/setenv lines I had in my dotfiles for it. But I run ksh everywhere I can now, specifically oksh from the OpenBSD project. Using pdksh on NetBSD on the weekend made me feel right at home.

*(As an aside, you really owe it to yourself to try [oksh](https://github.com/ibara/oksh), especially if you come from the Linux world and either assume bash, or immediately reach for it from packages when trying another \*nix. It's pretty cool, especially how you can extend its tab completions. That's for another post).*

I know the whole thing about *csh programming considered harmful*, but dare I say I found scripting in it easier than the Bourne shell family too. Maybe it was down to not hitting many edge cases, and delegating to Perl when things got complex enough to warrant functions, etc.


