---
title: "Custom awk delimiters"
date: "2019-09-24T11:46:21+10:00"
abstract: "In our continuing series of things you already know unless you don’t."
year: "2019"
category: Software
tag:
- apple
- bsd
- debian
- freebsd
- illumos
- linux
- macos
- netbsd
location: Sydney
---
In our continuing series of [things you already know unless you don't](https://rubenerd.com/things-you-already-know-unless-you-dont), say you want to process a string in awk using a delimiter other than a space, or as awk referres to as a *field seperator*:

    $ echo "Bird'is'the'Word" | awk '{ print $1 }'
    ==> "Bird'is'the'Word"

You use the `-F` argument to split on a different character. I used a single quote here to remind us to escape characters if needed, or wrap in quotes:

    $ echo "Bird'is'the'Word" | awk -F\' '{ print $1 }'
    ==> Bird

This works in the One True Awk&trade; found on BSDs, macOS and illumos; and gawk from GNU.

