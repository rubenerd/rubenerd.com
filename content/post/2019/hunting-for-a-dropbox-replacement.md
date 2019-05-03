---
title: "Hunting for a Dropbox replacement"
date: "2019-04-22T09:22:06+10:00"
abstract: "My wishlist and some potential options from Twitter folks."
year: "2019"
category: Software
tag:
- dropbox
- nextcloud
- rsync
- syncthing
location: Sydney
---
Dropbox recently announced that free accounts would be limited to three devices. That includes a laptop, desktop, and my personal phone... but there are other ones I want to add. I only ever needed the free tier, so it's time to look elsewhere.

To be clear, it's an inconvenience, but I'm not angry with Dropbox for this change. They owed me little as a free user, and it finally gave me the impetus to research alternatives. [Encrypted sparsebundles](https://rubenerd.com/practical-private-dropbox-use-cases/ "Blog post from 2014 on practical uses for Dropbox") were also a hack.

### My wishlist

* A simple file-sync service that handles merge conflicts and deletions nicely. I'd lean towards a centralised source of truth somewhere, but I wouldn't be adverse to a <abbr title="peer to peer" style="border:0; text-decoration:none;">P2P</abbr> approach.

* Self-hosted, either on my home bhyve, or an OrionVM FreeBSD instance. If I'm putting the effort into moving services, I may as well go all the way rather than substituting with another hosted service that <del>could</del> will change. It also means I can have data encrypted at rest without ugly containers.

* Integration with a good iOS text editor like [1Writer](http://1writerapp.com/ "1Writer official website"), and presents a generic enough share for something like nvALT on the desktop.

* A FreeBSD binary, or source available. And while I'm at it, native macOS and a .deb for my lone Debian box. Qt is fine :).

* Easily shareable, for stuff Clara and I work on together.


### Options I'm considering

* NextCloud on a ZFS jail or on my bhyve box at home. My experience with the original ownCloud was mixed, but I've been told by people who'd know that it's much improved.

* Rsync superficially looks like the easiest option, but I can see where it could get messy quickly with lots of different machines.

* Syncthing looks like the nicest distributed option.

* Resilio Sync (*né Bittorrent Sync*) has positive reviews, but I may as well use Syncthing if going down this route.

Let me know if you have any suggestions.

