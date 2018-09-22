---
title: "Using rsyncd instead of rsync over SSH"
date: "2018-05-20T15:11:34+10:00"
abstract: "The performance difference can be huge in trusted environments"
year: "2018"
location: Sydney
category: Software
tag:
- bsd
- freebsd
- rsync 
---
The easiest way to use [rsync] is with the default SSH transport option. It's easy, secure, and reasonably fast. Machines will bottleneck elsewhere before your CPUs will encrypting/decrypting the ssh streams, from my experience. And you get all the SSH niceties, like pre-shared keys and host config files.

But this weekend I needed to transfer to an older machine without [AES-NI]. And in this case, it was most definitely pegging the CPU long before the network link was saturated, as htop showed:

    1 [||||||||||||||||||||||||||99.7%]

There are two ways around this with rsync:

* keep SSH, but enable a faster cipher like arcfour; or
* use an unencrypted rsync stream with rsyncd, like rsync used to do.

I thought I'd try the latter, like a gentleman.

### rsyncd

rsync used to ship with a client-server system using rsyncd as its default operating mode. If you [install it on FreeBSD] thanks to rodrigo@, the rsyncd rc script still exists:

    # pkg install rsync
    # ls -F /usr/local/etc/rc.d/
    # ==> rsyncd*

The [manpage is your friend], but [this Everything Linux guide from 1999] is still the nicest I've found online to get started.

*It goes without saying you'd only want to run it on a trusted network. No really, if you do these on a production site over the internet or another shared network, you'd better hope the data isn't confidential!*


### A quick and dirty test

I transferred a 1GiB test file generated with urandom three times, and averaged the transfer times. These were the rough results:

Transfer method         | Reported speed
------------------------|----------------
rsync with default SSH  | 28.11MB/s
rsync with arcfour SSH  | 32.61MB/s
rsyncd                  | 48.77MB/s

And the CPU on the target box went from full utilisation, to hovering around 30%. I was surprised at this drop, given rsync would still be computing hashes to verify file transfers. This would seem to confirm my suspicion the CPU was bottlenecking on the SSH side.

There are plenty more optimisations available, but this wasn't a bad effort for 10 minutes of work!


### Troubleshooting

I followed the rsyncd.conf manpage for configuring rsyncd on the FreeBSD server, but I kept getting stream closure errors. I like open streams, they let me transfer data.

So I enabled logs in rsyncd.conf, like a gentleman:

    log file = /var/log/rsyncd.log

Then restarted the daemon, and tried the transfer again. From the logs:

    2018/05/06 12:08:37 [23834] ERROR: module is read only

If you read the documentation—what a concept—read only is the default. Whoops!

[rsync]: https://www.rsync.org/
[AES-NI]: https://software.intel.com/en-us/articles/intel-advanced-encryption-standard-instructions-aes-ni "Intel Advanced Encryption Standard Instructions (AES-NI)"
[this Everything Linux guide from 1999]: https://everythinglinux.org/rsync/
[manpage is your friend]: https://download.samba.org/pub/rsync/rsyncd.conf.html
[install it on FreeBSD]: https://www.freshports.org/net/rsync/

