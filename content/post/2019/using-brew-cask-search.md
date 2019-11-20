---
title: "Using brew cask search"
date: "2019-11-15T16:20:46+11:00"
abstract: ""
thumb: ""
year: "2019"
category: Software
tag:
- package-managers
location: Sydney
---
Happy Sunday! I've switched to pkgsrc on most of my Macs, but I still need Homebrew on one machine. The one advantage of Homebrew is you can use Cask to install graphical applications.

The thing to remember is, unlike `pkg` or `apt-get`, you must specify the `cask` command for these applications:

    $ brew install keepassxc
    ==> Error: No available formula with the name "keepassxc" 
    ==> Found a cask named "keepassxc" instead. Try
    ==>    brew cask install keepassxc

Except for `search`, which they depracated and removed:

    $ brew cask search See also "man brew-cask"
    ==> Error: Unknown Cask command: search

I understand the technical reasons why, but it's not great for usability.

