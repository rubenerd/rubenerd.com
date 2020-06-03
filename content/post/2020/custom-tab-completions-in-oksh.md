---
title: "Custom tab completions in oksh"
date: "2020-05-30T09:52:30+10:00"
abstract: "Using the set -A complete_ syntax for commonly-used commands"
year: "2020"
category: Software
tag:
- bsd
- freebsd
- ksh
- linux
- netbsd
- openbsd
location: Sydney
---
A [chat with @zoomosis](https://twitter.com/zoomosis/status/1266537716142858241) made me realise that I never talked about oksh's tab completion, which is half the reason I use and spruik it as a daily driver shell.

For a recap, I moved to [oksh](https://github.com/ibara/oksh) on my Macs and BSD boxes so I could keep roughly the same .kshrc config on each machine I own, even my ancient nostalgia boxes. FreeBSD notably doesn't include a Kornshell, but macOS and NetBSD do. oksh adds a couple of nice features, while still being fast and lightweight.

oksh's tab completion is the other reason. Using `set` statements you can define tab completions for commands you specify. I like to keep these in a separate file, and reference it in my .kshrc:

    [ -f ~/.oksh_completions ] && . ~/.oksh_completions

The syntax is simple. Here are some common FreeBSD commands:

    set -A complete_geli -- attach backup configure detach
    set -A complete_iocage -- create destroy fetch get list rename restart set start stop
    set -A complete_pkg -- clean info install lock search unlock update upgrade
    set -A complete_pkgin -- autoremove avail install full-upgrade pkg-info remove search update
    set -A complete_zfs -- clone create list receive send set snapshot
    set -A complete_zpool -- create export import scrub set

Because it's a shell script, you could do this for SSH hosts:

    _SSH_HOSTS=$(awk '/^Host/{ print $2 }' ~/.ssh/config)
    set -A complete_mosh -- $_SSH_HOSTS
    set -A complete_scp -- $_SSH_HOSTS
    set -A complete_ssh -- $_SSH_HOSTS

And for services:

    _SERVICES=$(ls -1 /etc/rc.d/)
        
    case `uname` in
        FreeBSD)
            _SERVICES="$_SERVICES $(ls -1 /usr/local/etc/rc.d/)"
    esac

There's a lot you could configure here, and I've probably only scratched the surface.
