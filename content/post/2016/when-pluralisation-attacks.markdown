---
title: "When pluralisation attacks"
date: "2016-03-17T15:50:00+10:00"
summary: "It’s virtualbox-extension-pack, not extensions!"
category: Software
tag:
- virtualbox
- when-x-attacks
---
    $ brew cask search virtualbox
    ==> Exact match
    virtualbox
    ==> Partial matches
    virtualbox-extension-pack
     
    $ brew cask install virtualbox-extensions-pack
    Error: No available Cask for virtualbox-extensions-pack
    Error: nothing to install
    
    $ echo "HUH!?"
    HUH!?

    $ brew cask install virtualbox-extension-pack
    ==> Satisfying dependencies
    ==> Installing Cask dependencies: virtualbox
    [..]
    complete

