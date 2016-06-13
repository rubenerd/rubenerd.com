---
title: ""
---
I got a surprise this morning when updating Homebrew:

    $ brew update
    Updated Homebrew from b9552a5 to b2c9625.
    Updated 4 taps (caskroom/cask, caskroom/fonts, homebrew/core, homebrew/dupes).
    ==> Cleaning up /Library/Caches/Homebrew...
    ==> Migrating /Library/Caches/Homebrew to /Users/me/Library/Caches/Homebrew...
    ==> Deleting /Library/Caches/Homebrew...

Seems weird to move the cache to your home folder, when the default for the package manager itself is still /usr/local/bin. I suppose at some level this means one could run multiple Homebrews on the same machine without caches clashing.

