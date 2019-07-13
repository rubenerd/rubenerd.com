---
title: "Versions of ksh93 in macOS, FreeBSD"
date: "2019-06-26T22:38:06+10:00"
abstract: "macOS has shipped with the KornShell since Tiger, but I was interested to see what version."
year: "2019"
category: Software
tag:
- apple
- bsd
- freebsd
- kornshell
- macos
- shells
location: Sydney
---
There's not much point to this post; it was bourne of some idle curiosity. Ah man, that pun was *top shelf*. macOS has shipped with the [KornShell](http://kornshell.org/) since Tiger, but I was interested to see which version it had. Here's 10.14 Mojave:

    $ /bin/ksh --version
	    version sh (AT&T Research) 93u+ 2012-08-01

I'd been installing it with Homebrew (via Ansible) since I switched to it as my primary interactive shell, but it's the same:

    $ /usr/local/bin/ksh --version
	    version sh (AT&T Research) 93u+ 2012-08-01

The latest version from FreeBSD ports is fresher:

    $ ksh93 --version
        version sh (AT&T Research) 93v- 2014-12-24

Although I had a treat:

    # pkg upgrade ksh93
    ==> [...]
    ==> Installed packages to be UPGRADED:
	==> ksh93: 20141224 -> 2020.0.0.a1,1

The port's [commit history](https://www.freshports.org/shells/ksh93/) shows a lot of changes over the last month which I'm still mentally processing.

