---
title: "TigerVNC on macOS Mojave"
date: "2019-01-05T11:00:36+11:00"
abstract: "Delete your ~/.vnc folder if it doesn’t load."
thumb: ""
year: "2019"
category: Thoughts
tag:
- apple
- macos
- tigervnc
- vnc
- written-in-sydney
---
[TigerVNC] is *by far* my favourite cross-platform VNC client. Others try to shoehorn all these extra features, but TigerVNC presents you with a connection dialog. It's not Retina/HiDPI, but nothing I'm connecting to is anyway.

But it stopped loading starting with macOS 10.14 Mojave. I tried the latest stable and nightly builds on two separate Macs, and both times the icon for the application would bounce once, then quit. Launching from the Terminal worked.

I filed a [bug report], and one of the developers suggested I remove my `~/.vnc` folder. I didn't think to move that folder instead so I could check what was causing the problem.

Anyway, it worked!

[TigerVNC]: https://github.com/TigerVNC/tigervnc
[bug report]: https://github.com/TigerVNC/tigervnc/issues/784

