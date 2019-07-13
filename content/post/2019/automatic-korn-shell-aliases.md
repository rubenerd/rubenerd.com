---
title: "Automatic Korn Shell aliases"
date: "2019-07-11T16:59:05+10:00"
abstract: "As per the NetBSD-current ksh(1) manpage."
thumb: "https://rubenerd.com/files/uploads/anime.netbsd.mai.bw.420.jpg"
year: "2019"
category: Software
tag:
- bsd
- ksh
- netbsd
location: Sydney
---
I've mentioned a few times that I'm trialling the Korn Shell as my daily driver. I used `tcsh` for many years due to my preference for FreeBSD, but I prefer writing quick one-liners in Bourne.

Today I learned the Public Domain Korn Shell (`pdksh`) defines the following aliases automatically, as per the [NetBSD ksh(1)](https://netbsd.gw.com/cgi-bin/man-cgi?ksh+1.amd64+NetBSD-current) manpage. NetBSD is where I first used the Korn Shell, and it's bundled in its base system.

    autoload='typeset -fu'
    functions='typeset -f'
    hash='alias -t'
    history='fc -l'
    integer='typeset -i'
    local='typeset'
    login='exec login'
    nohup='nohup '
    r='fc -e -'
    stop='kill -STOP'
    suspend='kill -STOP $$'
    type='whence -v'

Sure enough:

    $ type
    ==> Usage: whence [-afpqv] name  ...

I've seen manpages for other Korn Shell variants list more options, but I'm going to treat this list as canonical. It'd be a fun exercise to compare and contrast.

