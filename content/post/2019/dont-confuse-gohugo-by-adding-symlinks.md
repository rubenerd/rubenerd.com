---
title: "Don’t confuse gohugo by adding symlinks"
date: "2019-04-17T00:21:46+10:00"
abstract: "Cannot walk regular file... strikes again."
year: "2019"
category: Software
tag:
- blogging
- gohugo
- troubleshooting
location: Sydney
---
I was wondering why [Hugo](https://gohugo.io) could generate on my FreeBSD cloud VM, but not locally. I ran a plain hugo command:

    $ hugo
    ==> Error: Cannot walk regular file

Could this just be it? If so, it's one of the most routine mistakes one can make on a \*nix system.

Earlier in the week I'd created a symlink to the layouts directory of my current theme, to save some typing.

    $ ln -s ./themes/rubenerd-rubi/layouts ./layouts

Even though Hugo's `config.yaml` was specifically set to use that theme, it still attempted to load that folder as well. I've since learned this is expected, and in fact desired behavior: you may want to override a theme with a local site file.

*(Yes, I use YAML. I couldn't grok TOML).*

So lesson learned, don't try and get clever.

