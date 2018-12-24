---
title: "Scoop is another Windows package manager"
date: "2018-11-28T09:18:39+11:00"
abstract: "Uses the same methadology as Homebrew"
year: "2018"
category: Software
tag:
- chocolately
- package-managers
- scoop
- software
- windows
- written-in-sydney
---
[Chocolately] is among the first things I install on any Windows machine I find myself forced to use. The \*nix world has thoroughly spoiled me with package managers, so to use a system with wizard installers isn't so much foreign as an absolute affront.

Chocolately works in a similar vein to apt or yum, in that it installs packages into system default locations. For example, if I install Firefox as per below, it'll be put into `Program Files`:

	PS R:\> choco install firefox

This works, but I far prefer the BSD approach of having all your packages under its own tree. There are many benefits, including being able to blow away the whole tree and still have a bootable system. FreeBSD places your ports in `/usr/local/bin` by default; NetBSD and its ilk do the same thing with pkgsrc.

Even better still is the macOS Homebrew system. It takes the next logical step of placing every package in its own tree, so you don't end up with dependency hell. Drive space is cheap, so why not?

[Scoop] is a package manager I learned about yesterday that takes this Homebrew approach for a [suite of \*nix tools]. So you get this:

	PS R:\> scoop install sed

I wonder if there will be a Homebrew Cask alternative for GUI applications soon? That'd be cool.

[suite of \*nix tools]: https://github.com/lukesampson/scoop/tree/master/bucket
[Chocolately]: https://chocolatey.org/ 
[Scoop]: https://scoop.sh/
 
