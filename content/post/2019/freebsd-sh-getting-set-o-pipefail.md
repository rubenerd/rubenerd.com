---
title: "FreeBSD sh getting set -o pipefail"
date: "2019-02-28T08:57:12+11:00"
abstract: "Invaluable for people with lives outside bash."
year: "2019"
category: Software
tag:
- bourne-shell
- bsd
- freebsd
location: Sydney
---
Jilles Tjoelker has just [commited this change] to FreeBSD sh:

> sh: Add set -o pipefail
> 
> The pipefail option allows checking the exit status of all commands in a pipeline more easily, at a limited cost of complexity in sh itself. It works similarly to the option in bash, ksh93 and mksh.

This is awesome, especially if you're like me and don't install bash. `pipefail` is an invaluable sanity check and troubleshooting flag for scripts.

[commited this change]: https://reviews.freebsd.org/rS344502

