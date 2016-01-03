---
title: "Renaming anime for Plex"
date: "2016-01-01T12:13:00+10:00"
summary: "Using awk you can make light work of it"
category: Anime
tag:
- awk
- bsd
- debian
- freebsd
- linux
- plex
---
A new years goal for myself (thank you Phil Gerbyshak, always better to have a goal or plan than a resolution) is to finish importing all my hypothetical media into Plex. I'd done my English shows a while ago, but I'm even more eager now that Clara bought me a new Apple TV!

### Batch renaming episodes

You don't want to rename episodes individually to the Plex standard. You can use any number of third party tools, but I prefer just to use some disgusting awk.

Episodes tend to follow this sort of pattern:  

    [Sub]_Series_Episode_Junk[BD/TV, FPS, Resolution, Checksum...).mkv

There are dozens of ways (with dozens of tools) you could slice this.

The easiest is to tokenise based on a delimiter, like the underscore in this case. The problem is, sometimes fansubbers name their files with the episode number butted against the junk. You could use sed to swap all non-important characters with underscores before the split, but that's an extra line of work.

Instead, I fall back to character splitting with some terrible awk and a shell loop. This works because the episode numbers are in the same place for a series.

    for f in *; do mv "$f" "$(echo $f | awk '{split($0,p,""); print "K-ON! - s02e" p[10] p[11] ".mkv" }' )"; done

This splits a file into characters, pulls character 10 and 11 for the episode number, and renames it. You'll need to adjust the position of the numbers each time; the only downside to this method. You could substitute the loop for a find, and do that echo nicer, but meh.

### OVAs
There doesn't really seem to be a consensus on how to handle these, but the most common hack seems to be shoving them in the Specials folder, and using the s00eXX convention. If anyone knows a better way to do this, I'd love to hear.
