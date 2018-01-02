---
title: "brew cask move yourself"
date: "2016-06-14T11:58:00+10:00"
category: Software
tag:
- homebrew
- homebrew-cask
- mac-os-x
- macos
- os-x
- package-managers
---
I got a surprise this morning (June 8) when updating [Homebrew]:

    $ brew update
    Updated Homebrew from b9552a5 to b2c9625.
    Updated 4 taps (caskroom/cask, caskroom/fonts, homebrew/core, homebrew/dupes).
    ==> Cleaning up /Library/Caches/Homebrew...
    ==> Migrating /Library/Caches/Homebrew to /Users/me/Library/Caches/Homebrew...
    ==> Deleting /Library/Caches/Homebrew...

Seems weird to move the cache to your home folder, when the default for the package manager itself is still /usr/local/bin. I suppose at some level this means one could run multiple Homebrews on the same machine without caches clashing.

*Caches Clashing*. **HARRISON FORD**. *"I'm going to clash your cache!"*

It also looks like the [Cask] caskroom has moved as well:

    $ brew cask update
    ==> Warning: The default Caskroom location has moved to /usr/local/Caskroom.
    ==>
    ==> Please migrate your Casks to the new location, or if you would like to 
    ==> keep your Caskroom at /opt/homebrew-cask/Caskroom, add the following to 
    ==> your HOMEBREW_CASK_OPTS:
    ==>
    ==>     --caskroom=/opt/homebrew-cask/Caskroom
    ==>
    ==> For more details on each of those options, see 
    ==> https://github.com/caskroom/homebrew-cask/issues/21913.

Fortunately, this hasn't moved:

    $ apt-get update
    ==> Ruben you eejit, you're on your Mac.
    $ pkg update
    ==> Ruben you eejit, you're on your Mac.

Cue a reference to the [Universal Install Script], which regrettably uses bash and is therefore less portable than it first suggests. Shocking, I know.

[Homebrew]: http://brew.sh/
[Cask]: https://caskroom.github.io/
[Universal Install Script]: https://xkcd.com/1654/

