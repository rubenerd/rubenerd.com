---
title: "ssh, sftp, scp, tftp port fun"
date: "2016-04-09T10:01:00+10:00"
abstract: "Slash dot dash dot inconsistent"
year: "2016"
location: Sydney
category: Software
tag:
- ftp
- scp
- sftp
- ssh
---
To start an SSH session on a specific port:

    $ ssh -p 22222 host

To download a file over SCP on a unique port:

    $ scp -P 22222 host:file .

To start an SFTP session on a specific port:

    $ sftp -oPort=22222 host

To start an tftp session on a specific port:

    $ tftp host 22222

Hashtag Linux userland! Time to break out some port of another nature.

**UPDATE:** I wrote about [SFTP ports] seven years ago. I guess my memory is worse than I thought, though at least it hasn't affected my memory.

[SFTP ports]: https://rubenerd.com/p3729/ "Initiating SFTP connections with a non standard port"

