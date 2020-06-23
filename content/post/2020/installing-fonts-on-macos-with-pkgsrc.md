---
title: "Installing pkgsrc fonts on macOS"
date: "2020-06-12T20:58:15+10:00"
abstract: "cp /opt/pkg/share/fonts/X11/*/* /Library/Fonts/"
thumb: "https://rubenerd.com/files/2020/icon-pkgsrc.png"
year: "2020"
category: Software
tag:
- apple
- design
- fonts
- macos
- package-manager
- pkgin
- pkgsrc
location: Sydney
---
NetBSD's [pkgsrc](https://www.pkgsrc.org/) is a cross-platform package manager I use wherever I can, including my Macs and Linux machines. It works out of the box for most things, but macOS searches for fonts in a different place. It also doesn't seem to pick up on symlinks, so you can't just link the pkgsrc version to the macOS fonts folder.

The cleanest workaround I've found is to create a new pkgsrc folder:

    # mkdir /Library/Fonts/pkgsrc/ 

Then copy the required fonts over after installing:

    # pkgin install Code-New-Roman
    # cp /opt/pkg/share/fonts/X11/OTF/* /Library/Fonts/pkgsrc/
    # cp /opt/pkg/share/fonts/X11/TTF/* /Library/Fonts/pkgsrc/

Part of the reason for using pkgsrc over Homebrew is you get a system-wide install in `/opt` by default. But you can replace target with `~/Library/Fonts` if you only want to install for the local user.

