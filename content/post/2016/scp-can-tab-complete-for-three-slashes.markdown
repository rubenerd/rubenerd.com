---
title: "scp can tab-complete for three slashes"
date: "2016-04-09T16:11:58+10:00"
summary: ""
category: Thoughts
tag:
- 
---
I’ve been doing a ton of data re-arranging and backing up with another HP Microserver. With ZFS of course, I'm not an animal.

In the process, I’ve been using rsync for merging folders, and simple scp for new batches of files. This workflow was typical:

    $ scp * destination:/tank/plex/anime/Natsume Yuujinchou/

Seasoned sysadmins and *nix people will see the first problem here. I didn't escape the space, so it created a folder at the destination called this:

    $ ls /tank/plex/anime/
    ==> [..]
    ==> Natsume

So I escaped the space:

    $ scp * destination:/tank/plex/anime/Natsume\ Yuujinchou/ 

And the same thing happened. I put the folder in double quotes, in single quotes; even in Perl-style qw// for shits and giggles. Nothing.

Then quite by accident, I discovered scp does tap completion on the remote server. Pretty cool! So I tabbed to see what it was expecting for this folder:

    $ scp * destination:/tank/plex/anime/Natsume[TAB]

And I got this:

    ==> scp * destination:/tank/plex/anime/Natsume\\\ Yuujinchou

When one escape isn't enough, use two! Except then you're escaping the backslash. So we'd better add another one.

Today I learned.

