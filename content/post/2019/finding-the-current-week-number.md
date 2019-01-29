---
title: "Finding the current week number"
date: "2019-01-22T11:37:11+11:00"
abstract: "In our ongoing series of things you already know, unless you don’t"
year: "2019"
category: Software
tag:
- bsd
- freebsd
- linux
- netbsd
location: sydney
---
In our ongoing series of [things you already know, unless you don't], you can get the current week number using the C-style `date(1)` tool in your \*nix of choice:

    $ date +"%U"
    ==> 02

I use week numbers everywhere, especially for task lists. I saw them a lot in Singapore, but I've never seen them used in Australia.

[things you already know, unless you don't]: https://rubenerd.com/tag/things-you-already-know-unless-you-dont/

