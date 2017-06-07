---
title: "FreeBSD and ZFS with Plex"
date: "2016-09-02T12:19:00+10:00"
category: Thoughts
tag:
- media
- bsd
- freebsd
- plex
---
The Gen8 HP MicroServers are wonderful little boxes. For less money than most NAS devices, you can get a tiny, server-grade cube with four drive bays, ECC memory and Xeon CPU support. I used to use mine with 4 drives in RAIDZ1, but now I use two mirrored pairs for performance and easier upgrading.

For use with ZFS, you have a few options:

* OpenSolaris/illumos,
* Oracle Solaris,
* Linux with ZFSonLinux,
* or FreeBSD

Solaris has the advantage of native support, and Oracle's recent closed-source version even supports turnkey encryption. I trust FreeBSD and their ZFS implementation the most though, so the decision was easy.

But what about Plex? I'd installed it on Ubuntu Server and Debian many times, but I noticed (several years too late!) that the media server software had FreeBSD support. Halljeluya! I believe it was introduced mostly for people using FreeNAS, but I've been really happy with how well its performed on FreeBSD since switching over to it.

Installation is a breeze thanks to the tireless package maintainers. I've read in enough places you need the compatibility package for certain C libraries as well:

    # pkg update
    # pkg install compat9x-amd64
    # pkg install plexmediaserver

And now you're good to go with the same URL and file management as any other Plex install, only this time you're backing it with a ZFS volume with error detection, correction and redudancy. Too cool.

Incidently, do Hitachi make 8TB drives yet?

