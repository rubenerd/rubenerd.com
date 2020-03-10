---
title: "What started as investigating /opt on FreeBSD"
date: "2020-02-16T18:54:55+11:00"
abstract: "This was far more detail than what this subject warranted."
thumb: ""
year: "2020"
category: Software
tag:
- bsd
- file-systems
- freebsd
- research
- sco
- solaris
- unix
location: Sydney
---
Last month I [wrote a post about symlinking](https://rubenerd.com/symlinking-freebsd-svnlite-to-svn/) `svnlite(1)` to `/opt/bin/svn` on stock FreeBSD, thus allowing Ansible's subversion module to checkout a repository in a playbook I was writing. This lead to more research into this file system structure than I expected.


### Did I get this from Solaris?

This post was SPARC'd—hah—from a discussion with two other Australian BSD gentleman on The Twitters last week. This [wasn't the first](https://twitter.com/Rubenerd/status/1228854605045362688?s=20) awful Solaris joke I've made today.

Here's [Ben Woods](https://twitter.com/woodsb02/status/1222847603596906501), whom I had the pleasure of meeting at the FreeBSD miniconf last month at Linux.conf.au:

> /opt/ ???? I feel dirty :)

And [Jason Tubnor](https://twitter.com/Tubsta/status/1223045007470256129), whom I met at AsiaBSDCon:

> Old skool Solaris admins still do

<p><img src="https://rubenerd.com/files/2020/IllumosPhoenixRGB.png" alt="illumos icon" style="width:64px; height:83px; float:right; margin:0 0 1em 2em" /></p>

I now felt dirty, and was questioning whether I picked up the `/opt` habit from using Solaris myself. I did use SunOS briefly at when studying at UniSA, and OpenSolaris was my introduction to ZFS back in the day. I even ran the first closed-source Solaris on my HP Microserver after Oracle sank their teeth into Sun. But I'm *fairly* sure my usage predates these.

My justification had always been about preventing package manager collisions with my own manually installed tarballs and scripts. The standard place for these is generally `/usr/local`, but that's where the BSDs put their packages by default, and macOS Homebrew puts brews. More on that later in this post.


### Checking out /opt on the BSDs

This rote behaviour got me curious, so I decided to do a bit of digging and checked out the `hier(7)` manpage on various operating systems, starting with everyone's favourites.

* [FreeBSD](https://www.freebsd.org/cgi/man.cgi?query=hier&sektion=7) makes no mention of `/opt`;
* nor does [NetBSD](https://netbsd.gw.com/cgi-bin/man-cgi?hier+7);
* nor does [OpenBSD](https://man.openbsd.org/hier.7);
* nor does [DragonFly BSD](https://leaf.dragonflybsd.org/cgi/web-man?command=hier&section=7); and
* nor does [Darwin/macOS](https://opensource.apple.com/source/man/man-151/usr/man/man7/hier.7.auto.html).

Interesting! So wherever I picked this up, it was outside the BSDs. It's starting to look like it might have been a Solaris-ism after all.


### GNU/Linux does mention it

systemd's [file-hierarchy(7)](https://www.unix.com/man-page/posix/7/file-hierarchy/) page doesn't include `/opt`. But the [Linux manpage](https://linux.die.net/man/7/hier) *does* mention `/opt/`, and as a bonus didn't even tell me to look in the GNU Info page instead. It also mentions another use at the start I didn't recognise:

> **/etc/opt** Host-specific configuration files for add-on applications installed in /opt. 
> 
> **/opt** This directory should contain add-on packages that contain static files.

I use `/opt` with separate directories for each package I'm installing, so my config would be in `/opt/$PACKAGE/etc` not in `/etc/opt`. And I'd put consolidated config into `/opt/src`.

The manpage also mentioned the Linux Filesystem Hierarchy Standard, which sure enough describes `/opt` in [section 3.13](https://refspecs.linuxfoundation.org/FHS_3.0/fhs/ch03s13.html), last updated in 2015:

> **/opt** is reserved for the installation of add-on application software packages. A package to be installed in **/opt** must locate its static files in a separate **/opt/\<package\>** or **/opt/\<provider\>** directory tree, where **<package>** is a name that describes the software package and **\<provider\>** is the provider's LANANA registered name.

The Rationale section has some interesting history:

> The use of **/opt** for add-on software is a well-established practice in the UNIX community. The System V Application Binary Interface [AT&T 1990], based on the System V Interface Definition (Third Edition), provides for an /opt structure very similar to the one defined here.
> 
> The Intel Binary Compatibility Standard v. 2 (iBCS2) also provides a similar structure for **/opt**.
> 
> Generally, all data required to support a package on a system must be present within **/opt/\<package\>**, including files intended to be copied into **/etc/opt/\<package\>** and **/var/opt/\<package\>** as well as reserved directories in /opt.
> 
> The minor restrictions on distributions using /opt are necessary because conflicts are possible between distribution-installed and locally-installed software, especially in the case of fixed pathnames found in some binary software.

Those *possible conflicts* are also another reason why I prefer running FreeBSD over other non-BSD operating systems. Keeping installed packages and the base system separate prevents whole classes of problems, and makes the system easier to maintain. 


### The System V Interface Definition

I was invested in researching this hierarchy, so I went to the source as described in the above Rationale section and downloaded the [System V Application Binary Interface](http://www.sco.com/developers/devspecs/gabi40.pdf) documentation from... SCO. That and Sun Microsystems break my heart. Under the File System Stricture and Contents section on page 189:

> The directory **/opt** of the **/** file system is the point of access to the **/opt** subtree. This directory subtree contains files installed by add-on application packages. The following describes the structure of the **/opt** subtree:
> 
> * **/opt** – The top directory of the **/opt** subtree.
> 
> * **/opt/pkg/bin** – Executable files provided by application packages and invoked directly by users.
> 
> * **/opt/pkg** – Where *pkg* is the abbreviated name of an add-on software package, contains all the static files installed on the system as part of that package.


### Filesystem Hierarchy Standard

I wrote this post a fortnight ago, but left it in drafts so I could clean up the formatting. Since then I was [reading this thread](https://forums.gentoo.org/viewtopic-p-34685.html) on the Gentoo forums about why Portage defaults to `/usr`, given it's stated design inspiration was the FreeBSD port system that uses `/usr/local.` This [lead to a PDF](http://www.pathname.com/fhs/pub/fhs-2.3.pdf) of the latest Filesystem Hierarchy Standard. Page 12 stated:

> **/opt** is reserved for the installation of add-on application software packages. A package to be installed in **/opt** must locate its static files in a separate **/opt/\<package\>** or **/opt/\<provider\>** directory tree, where **\<package\>** is a name that describes the software package and **\<provider\>** is the provider’s LANANA registered name.

This to me is key, and a good place to end this post:

> Distributions may install software in **/opt**, but must not modify or delete software installed by the local system administrator without the assent of the local system administrator.

### Conclusions

The history for where I started using this is no less vague than when I started, but I love this kind of research. It gets me thinking what other \*nix assumptions I've been living under over the last decade.

Am I using `/opt` correctly? I'd say at best, maybe.

