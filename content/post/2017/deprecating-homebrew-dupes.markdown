---
title: "Deprecating homebrew-dupes"
date: "2017-06-20T10:14:00+10:00"
abstract: "Packages already in macOS now in the core repo"
category: Software
tag:
- macos
- mac-os-x
- os-x
- homebrew
- package-managers
---
The Homebrew devs originally decided not to duplicate software bundled in macOS, and to build against what was already available. I could see advantages to this, but Apple often left us with such outdated stuff.

The original solution was to tap homebrew-dupes, then install your tool. So for example:

    $ brew info bc
    ==> From: https://github.com/Homebrew/homebrew-core/blob/master/Formula/bc.rb

Hey, wait a minute. The URL points to homebrew-core now. Has homebrew-dupes been depracated?

> Homebrew/dupes (depracated)  
> These formulae were those that duplicated software provided by macOS. All formulae were migrated to Homebrew/homebrew-core  
> Latest commit by MikeMcQuaid 3 months ago.

How about that! I approve of this.

