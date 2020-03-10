---
title: "Initialising a new self-hosted remote Git"
date: "2020-03-10T12:25:19+11:00"
abstract: "For when you can’t use Subversion"
thumb: "https://rubenerd.com/files/2020/thumb-subversion.jpg"
year: "2020"
category: Software
tag:
- git
- subversion
location: Sydney
---
I still use Subversion for reasons when I can, so I had to remind myself how to create a new self-hosted Git somewhere.

On your remote FreeBSD server, for example:

    # pkg install git-lite
    $ mkdir ~/shinyrepo
    $ cd ~/shinyrepo
    $ git init --bare

On your workstation:

    $ git clone username@host:shinyrepo

This is assuming the repo is in your home directory, which in production you probably would [stash](https://git-scm.com/docs/git-stash)&mdash;ah, so good&mdash;somewhere else.

