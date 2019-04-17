---
title: "Subversion in OrionVM FreeBSD templates"
date: "2019-04-11T16:20:47+10:00"
abstract: "Expanding on why I switched to just using svnlite in OrionVM's FreeBSD templates I maintain, instead of using portsnap and installing pkg by default. Also, RootOnZFS!"
year: "2019"
category: Software
tag:
- bsd
- freebsd
- orionvm
- svn
- subversion
location: Sydney
---
When I first started building and maintaining the FreeBSD templates on the OrionVM cloud, I included a full ports tree [extracted with portsnap](https://www.freebsd.org/doc/en_US.ISO8859-1/books/handbook/ports-using.html#ports-using-portsnap-method "FreeBSD Handbook: Portsnap Method of installing ports"), and I [installed pkg](https://www.freebsd.org/doc/en_US.ISO8859-1/books/handbook/pkgng-intro.html "FreeBSD Handbook: Using pkg for Binary Package Management"). I figured this would give people a ready to use system more quickly out of the box, and would make initialising a system with tools like Ansible easier.

But it came with a couple of problems:

1. Clients may only want a subset of the ports tree, or may want to use Subversion, or only use binary packages. In which case, my installing it at best wasted space.

2. Binary packages may want to be sourced from quarterly or latest, depending on the target server and requirements.

This presented me with a poser. Our context system that live-injects SSH keys, IP addresses, and other user variables relied upon bash, because it was bootstrapped off our Linux templates. I spent part of my AsiaBSDCon 2019 WIP talk discussing how I'd rewritten all of this to use Bourne shell scripts, so no more needing to install bash from ports.

Which lead to the second point: did I still want to provide Subversion in the base image so people can [use it to pull ports](https://www.freebsd.org/doc/en_US.ISO8859-1/books/handbook/ports-using.html#ports-using-subversion-method "FreeBSD Handbook: Subversion Method of installing ports") and sources in new VMs? The official FreeBSD Handbook lists installing Subversion as a discrete step before you can pull ports, but to do so I either needed a ports tree, or pkg. What to do?

I was checking the output from `freebsd-update fetch`, like a gentleman, and was reminded of something as an update line scrolled by:

    /usr/bin/svnlite
    
That's right, FreeBSD [comes with a Subversion client](https://www.freebsd.org/doc/handbook/svn.html#svn-svnlite "FreeBSD Handbook: Using Subversion: Svnlite"). Somehow in this whole calculus I completely forgot about this. It's also perfect for bootstrapping.

So now, without pkg, or a ports tree, one can download the latter:

    # svn checkout https://svn.FreeBSD.org/ports/head /usr/ports
    ==> -sh: svn: not found

Haha whoops, wrong one:

    # svnlite checkout https://svn.FreeBSD.org/ports/head /usr/ports
    ==> [...]
    ==> Checked out revision 498652

And because all the OrionVM FreeBSD templates use RootOnZFS with all the default options, there's already a ZFS dataset for /usr/ports :).

The other option I've been considering is whether to ZFS snapshot any changes to stock FreeBSD, such that users could rollback or commit any changes I've done to the template after, such as including our context system. Then it wouldn't matter what I added; you could always blow it away with a `zfs destroy`. I've give this some thought.

