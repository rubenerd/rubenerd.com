---
title: "Finding outdated homebrews"
date: "2018-07-01T14:04:25-07:00"
abstract: "Using the outdated command, surprising though it may seem."
year: "2018"
category: Software
tag:
- california2018
- mac
location: san-francisco
---
We have a few different ways to [check for outdated ports] on FreeBSD. [Homebrew] on macOS has a useful `outdated` command:

    $ brew outdated  
      
    ==> ansible (2.5.4) < 2.6.0
    ==> ffmpeg (4.0) < 4.0.1
    ==> gdbm (1.14.1_1, 1.15) < 1.16
    ==> git (2.17.0) < 2.18.0
    ==> harfbuzz (1.8.1) < 1.8.1_1
    ==> hugo (0.40.3, 0.42.1) < 0.42.2
    ==> icu4c (61.1) < 62.1
    ==> imagemagick (7.0.7-35) < 7.0.8-3
    ==> libunistring (0.9.9) < 0.9.10
    ==> libyaml (0.1.7) < 0.2.1
    ==> p11-kit (0.23.10) < 0.23.12
    ==> python (3.6.5) < 3.7.0

That's a few outdated ports, including the world's [greatest automation tool], and the world's greatest [static site generator]. This cannot stand! Presumably because they don't have legs.

    $ brew upgrade --verbose

This will upgrade everything, unless you've used `pin`. This is consistent with FreeBSD's pkgng.

[check for outdated ports]: https://www.freebsd.org/doc/en/books/handbook/ports-using.html#ports-upgrading "FreeBSD Handbook: Upgrading Ports"

[Homebrew]: https://brew.sh/

[static site generator]: https://gohugo.io/

[greatest automation tool]: https://www.ansible.com/

