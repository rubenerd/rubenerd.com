---
title: ".dotfile management"
date: "2020-06-09T08:20:20+10:00"
abstract: "Having things in repos makes life much easier"
year: "2020"
category: Software
tag:
- bsd
- freebsd
- linux
- netbsd
- scripts
location: Sydney
---
One of the defining feautures of \*nix is that all your user-specific configuraiton is contained in dotfiles in your home directory. With a bit of care to make them POSIX or [portable](https://linux.die.net/man/1/checkbashisms "manpage for the checkbashisms script"), one could use the same dotfiles on FreeBSD, macOS, illumos/Solaris, and Linux.

A lot of us keep our dotfiles in repos; partly to version control them, but also because it makes installing them on a new system super easy. I'm sure everyone has a flavour of the following script somewhere:

    #!/bin/sh
        
    linkneil() {
        if [ -f ~/.$1 ]; then
            echo "$1 already exists."
        else
            ln -s $(pwd)/$1 ~/.$1
            echo "Linked $1, like a boss."
        fi
    }
        
    linkneil kshrc
    linkneil profile
    linkneil oksh_completions
    linkneil vimrc
    linkneil ...
        
    case $(uname) in
        Darwin)
            linkneil shuttle.json ;;
        NetBSD)
            linkneil cvsup ;;
    esac

The `linkneil` function creates a symlink to the corresponding file in the repo folder where the script is run. It warns about files that are already there, so I don't clobber existing files inadvertently. Then the case statement adds OS-specific files.

An adventurous friend of mine back in the day had his git repo set to his home directory, and used `.gitignore` with a wildcard, then listed the specific dotfiles he was after. He claimed this made things easier by not having symlinks everywhere, but he soon realised it was way more trouble than it's worth. That friend was me, but I'm referring to myself in the third person so people don't judge me.

