---
title: "Check for bashisms"
date: "2016-09-28T18:23:00+10:00"
abstract: "Using checkbashisms"
year: "2016"
category: Software
tag:
- fb
- shell-scripting
- written-in-sydney
---
For better or worse (depending on your disposition), GNU/Linux has become the *defacto* \*nix standard. But there are still plenty of unices out there, even Debian uses ash during start. If you're concerned with script portability, you should abstain from bashisms.

<p style="font-style:italic">I normally just call it Linux like a normal person, but this post concerns GNU bash, so I figured I’d make an exception. Purple monkey dishwashers).</p>

A quick way to check your scripts is with the excellent [checkbashims] script by Yann Dirson and Julian Gilbey. And it's even available on [homebrew], boom.

    $ checkbashisms -p retina.sh
    ==> possible bashism in retina.sh line 29 (<<< here string):
    ==> _original=`sed "s/this/that/" <<< $_image`
    ==> possible bashism in retina.sh line 61 (should be 'b = a'):
    ==> [ `uname` == "Darwin" ] && echo $_html | pbcopy

Heh, whoops. I've got some scripts to fix.

[checkbashims]: http://manpages.ubuntu.com/manpages/precise/man1/checkbashisms.1.html
[homebrew]: http://braumeister.org/formula/checkbashisms

