---
title: "Using Subversion with GitHub"
date: "2019-07-17T09:01:01+10:00"
abstract: "svn co --depth empty https://github.com/user/repo && svn up trunk"
year: "2019"
category: Internet
tag:
- git
- github
- svn
- subversion
location: Sydney
---
Today I (re)learned that GitHub repositories can be managed with Subversion over HTTPS. [GitHub's documentation](https://help.github.com/en/articles/support-for-subversion-clients "GitHub Help: Support for Subversion clients") lists these steps:

    $ svn co --depth empty https://github.com/user/repo

Then get the `trunk` branch, which maps to `HEAD` and is usually `master`:

    $ svn up trunk

Then get your branches:

    $ svn up --depth empty branches

I've had moving off GitHub as a stalled personal project for a long time, but this might help.

