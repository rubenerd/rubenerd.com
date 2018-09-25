---
title: "Basic sh to scan an IP range"
date: "2016-05-28T11:13:00+10:00"
year: "2016"
location: Sydney
category: Software
tag:
- scripting
- bourne-shell
- bsd
- freebsd
- netbsd
- linux
- networking
---
Here's a simple, cross platform way (read: no bashisms) to find hosts on a range of IP addresses:

    $ for n in $(seq 1 100); do ping -c2 10.0.1.${n}; done

Substitute the sequence numbers with upper and lower inclusive bounds. Better yet, replace them and the first three octets of the IP address with variables, and put them all in a script.

There's also nmap and its scanning range ability, but it isn't always available (and likely for good reason).

There were a lot of (superfluous) brackets in this. Or braces, or whatever we're supposed to call them. Brace yourself for brackets. Bracket yourself for parentheses. Everybody's heard that the Bird is the Word.

