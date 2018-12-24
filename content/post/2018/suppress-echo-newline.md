---
title: "Suppress echo newlines"
date: "2018-10-02T23:11:29+10:00"
abstract: "I was reading the FreeBSD sh(1) manpage, like a gentleman."
year: "2018"
category: Software
tag:
- bsd
- freebsd
- scripting
- shell
- things-you-already-know-unless-you-dont
- written-in-sydney
---
<p><img src="https://rubenerd.com/files/uploads/bsd_daemon.jpg" alt="" style="width:75px; height:75px; float:right; margin:0 0 1em 2em;" /></p>

In my continuing series of [things you already know, unless you don't], today I learned of an alternative to printing strings in the shell, sans newline.

I was reading the FreeBSD `sh(1)` manpage, like a gentleman:

     echo [-e | -n] [string ...]
       Print a space-separated list of the arguments to the
       standard output and append a newline character.
     
       -n  Suppress the output of the trailing newline.

Sure enough:

    $ echo saywhat
    ==> saywhat
    ==> $

And with `-n`:

    $ echo -n saywhat
    ==> saywhat$

This whole time I'd been doing this to avoid a newline:

    $ printf '%s' saywhat

Good ol' Kenneth Almquist, and the FreeBSD maintainers :).

But does this also apply to csh, the shell and scripting language allegedly considered harmful, and therefore you should write in? Under `echo_style` in the `tcsh(1)` manpage:

    bsd  Don't echo a newline if the first argument is `-n`;
         the default for csh.

Boom!

[things you already know, unless you don't]: https://rubenerd.com/tag/things-you-already-know-unless-you-dont/
