---
title: "brew install sshpass"
date: "2015-11-27T10:33:00+10:00"
abstract: "Saving ourselves from ourselves"
category: Infocomm
tag:
- software
- homebrew
- mac-os-x
- package-managers
- security
- ssh
---
Installing sshpass from Homebrew? Be prepared for this:

    $ brew install sshpass
    ==&gt; Error: No available formula with the name "sshpass" 
    ==&gt; We won't add sshpass because it makes it too easy for 
    ==&gt; novice SSH users to ruin SSH's security.

The (security) needs of many outweigh the needs of the few. Normally I find such overbearing policy frustrating, but in this case: good call.
