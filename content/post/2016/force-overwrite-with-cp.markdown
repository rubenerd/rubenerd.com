---
title: "Force overwrite with cp"
date: "2016-08-29T15:11:00+10:00"
year: "2016"
category: Software
tag:
- bsd
- freebsd
- guides
- linux
- netbsd
- written-in-sydney
---
Like any self-respecting engineer with butter fingers, I've taken out insurance in my bashrc by aliasing potentially destructive commands. -i asks me before clobbering a target, and -v enables verbose output:

    $ alias
    [..]
    ==> alias cp='cp -iv'
    ==> alias ln='ln -i'
    ==> alias mv='mv -iv'
    ==> alias rm='rm -iv'

These work almost too well. Sometimes, I fully intend to copy over a directory of files, but cp wants me to hit y for every single one:

    $ cp ./source/* ./dest/
    ==> overwrite shima.markdown? (y/n [n])

mv has a '-f' option, which forces mv not to prompt before overriding, even if -i or -n have been invoked. cp has no such option, so instead I piped `yes` to it!

    $ yes | cp ./source/* ./dest/

Another (perhaps more sane) approach is temporarily disabling the alias, though that does mean other options for that command would also be disabled, such as verbosity or colour:

    $ \cp ./source/* ./dest/

More astute readers would wonder why I'm overriding my own safeguards, thereby making them useless. Presumably I'd only do this when needed, and only after confirmation.

