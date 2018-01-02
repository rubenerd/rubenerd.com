---
title: "Installing Python pip in Homebrew"
date: "2017-11-02T11:52:02+11:00"
abstract: "The pip executable has the version appended to it"
category: Software
tag:
- python
- mac-os-x
- macos
- os-x
- homebrew
- package-managers
---
I wanted to use a fresher version of Python2 and pip. Fortunately Homebrew retired their old attitude that they wouldn't duplicate what was already on Mac OS X, OS X, macOS, OSXMac or MacXos.

Checking if Python is already installed:

    brew install python
    ==> Warning: python 2.7.14 is already installed

Sweet. Let's install pip:

    $ pip -V
    -bash: pip: command not found

Weird. I wonder if it's in Homebrew?

    $ brew install pip
    ==> Error: No available formula with the name "pip"
    ==> Homebrew provides pip via: `brew install python`.

Wait, but you just said...!

Not to get all Malcom Gladwell on you, but *turns out*, pip is named for its version:

    $ ls -1 /usr/local/bin/pip*
    ==> pip2
    ==> pip27

So now we can use:
    
    $ pip2.7 -V
    ==> pip 9.0.1 from /usr/local/lib/python2.7/site-packages (python 2.7)
    
