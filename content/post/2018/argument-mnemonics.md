---
title: "Argument mnemonics"
date: "2018-08-21T22:21:39+10:00"
abstract: "Cola on an LRT"
year: "2018"
location: Sydney
category: Software
tag:
- bsd
- freebsd
- linux
- mnemonics
- netbsd
---
I like argument and option mnemonics. I can see why standard usage documentation prefers to sort arguments <abbr title="lexographically">l15y</abbr>, but this way makes them much easier to remember.

For example, my standard directory listings:

    $ ls -cola

From the FreeBSD `ls(1)` manpage:

* Use time when file status was last changed for sorting or printing
* Include the file flags in a long (-l) output
* List files in the long format
* List all; include directory entries whose names begin with a dot

Or for sorting by ascending time modified, using the name of those Singaporean and Malaysian train systems:

    $ ls -lrt

From that same manpage:

* List files in the long format
* Reverse the order of the sort
* Sort by descending time modified (most recently modified first)

And the classic, audio-sounding aux:

    $ ps aux

From the FreeBSD `ps(1)` manpage:

* Display information about other users' processes as well
* Display information associated with the following keywords: user,
             pid, %cpu, %mem, vsz, rss, tt, state, start, time, and command.
* When displaying processes matched by other options, include
             processes which do not have a controlling terminal

And finally, a somewhat lowbrow insult to give to a folder that may be using way too much of your drive space:

    $ du -sh

From the FreeBSD `du(1)` manpage:

* Display an entry for each specified file
* "Human-readable" output. Use unit suffixes.

Unfortunately, `tar` and related tools will never have mnemonic arguments, unless `cjvf` becomes an overpriced clothing line or something.

