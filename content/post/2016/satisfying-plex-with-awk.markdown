---
draft: true
title: "Satisfying Plex with awk"
year: "2016"
category: "2016-03-20T16:43:00+10:00"
abstract: "Batch renaming done the easy way"
year: "2016"
category: Media
tag:
- awk
- linux
---
**WARNING:** Any file operations involving pattern matching can result in all your files being collapsed into one file in a bout of fail. If you use awk, backup first.

Say, hypothetically, you had Plex and were, hypothetically, renaming files for it to slurp up. Say they were named thusly:

    Show.S01E01.PROPER.HDTV.XviD-FQM.avi*
    Show.S01E01.Mother.S01E02.HDTV.XviD-NBS.avi*
    Show.S01E03.HDTV.XviD-TCM.avi*
    Show.S01E04.HDTV.XviD-FOV.avi*
    Show.S01E06.HDTV.XviD-TCM.avi*

If you tokenise on the full stops, the second element contains the season and episode number. The rest is useless and can be discarded.

So you can do this:

    $ for f in *; do mv "$f" \
        "$( echo $f | \
            awk '{split($0,p,".");print "Show - " tolower(p[2]) ".avi"}')"; \
    done

If your episodes are deliniated another way, change the split condition. You'll also want to change the p[x] array to correspond to which element the pertintent information is in.

You could also `find sed`, or some regex, but I'm all `for awk`. Hey, that sentence was pretty clever.

