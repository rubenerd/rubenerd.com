---
title: "You don’t need tmux or screen for ZFS"
date: "2020-08-20T21:33:15+10:00"
abstract: "Adding disks occurs in the background"
year: "2020"
category: Software
tag:
- bsd
- freebsd
- netbsd
- zfs
location: Sydney
---
Back in January I mentioned how to add redundancy to a ZFS pool by [adding a mirrored drive](https://rubenerd.com/making-a-zfs-mirror-from-an-existing-pool/). Someone with a private account on Twitter asked me why FreeBSD&mdash;and NetBSD!&mdash;doesn't ship with a [tmux](https://github.com/tmux/tmux/wiki) or [screen](https://www.gnu.org/software/screen/) equivilent in base in order to daemonise the process and let them run in the background.

ZFS already does this for its internal commands.  For example, I used **zfs add** to add a drive to fix a older RAIDZ2 pool, so I can just run:

    # zpool status

Under status:

    status: One or more devices is currently being resilvered.
    The pool will continue to function, possibly in a degraded state.

The pool will also continue to be available, though potentially with reduced IO performance while it (re-)replicates.

The only time I use tmux is during a large ZFS send/receive operation between machines over SSH. At that stage we've introduced networks into the mix, which even the most robust, trustworthy storage system in the world can't guarantee will stay up!

