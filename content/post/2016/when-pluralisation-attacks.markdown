---
title: "When pluralisation attacks"
date: "2016-03-18T15:50:00+10:00"
abstract: "It’s virtualbox-extension-pack, not extensions!"
year: "2016"
category: Software
tag:
- virtualbox
- virtualisation
- when-x-attacks
---
Or why you shouldn't attempt package manager installs before coffee.

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
    
    $ cowsay -e "><"  "Mumble grumble"
     ________________ 
    < mumble grumble >
     ---------------- 
            \   ^__^
             \  (><)\_______
                (__)\       )\/\
                    ||----w |
                    ||     ||

