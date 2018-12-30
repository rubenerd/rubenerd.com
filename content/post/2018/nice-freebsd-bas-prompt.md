---
title: "Nice FreeBSD bash prompt"
date: "2018-05-04T15:18:00+11:00"
abstract: "Seems like an odd choice for a tip."
year: "2018"
category: Thoughts
tag:
- bash
- bsd
- freebsd
- shell
- written-in-sydney
---
Every now and then I get the following upon logging into a FreeBSD box:

    Nice bash prompt: PS1='(\[$(tput md)\]\t <\w>\[$(tput me)\]) $(echo $?) \$ 

Seems like an odd choice for a tip, given bash is GNU and doesn't come with the base system. I guess the maintainers figure sufficient numbers of sysadmins install bash from ports.

I try as much as possible to still use tcsh for my interactive shell, and standard sh for scripts.

