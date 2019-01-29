---
title: "When you cd to double slashes in bash, tcsh"
date: "2018-03-23T18:27:50+11:00"
abstract: "bash says you’re in a double slash, other shells do not"
year: "2018"
category: Software
tag:
- bash
- shell
- bsd
- freebsd
- netbsd
location: sydney
---
Here's something fun I discovered by accident. When you typo a path with double forward slashes in a bash prompt with a default PS1 listing the working directory with `\w`, you get double slashes:

    user@machine /path/$ cd //
    user@machine //$

This also happens in sh on Linux and Mac OS X, presumably because sh aliased to bash.

    $ cd //
    $ pwd
    ==> //

This is not the case in tcsh:

    [machine:/path/] user% cd //
    [machine:/] user%

Or with Almquist sh on FreeBSD:

    $ cd //
    $ pwd
    ==> /

But it gets funky if we chain shells. If we start with bash, then launch tcsh, the current double slash working directory is preserved:

    user@machine /path/$ cd //
    user@machine //$ tcsh
    [machine://] user%

I haven't tried with zsh or fish.

