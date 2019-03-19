---
title: "Inline substitution with NetBSD sed"
date: "2019-03-18T08:59:17+11:00"
abstract: "Use it the same as GNU sed for inline substitution, not like FreeBSD"
year: "2019"
category: Software
tag:
- bsd
- freebsd
- gnu
- linux
- netbsd
location: Sydney
---
I'm writing this on a plane to Japan for AsiaBSDCon again! I learned last year that NetBSD has a unique place there, and I've been keen to continue exploring it. My challenge for this year is to have NetBSD on par with FreeBSD on OrionVM, including full contextualisation. But I digress.

**tl;dr** Use NetBSD sed the same as GNU sed, not FreeBSD sed, for inline subtitution. You probably don't want or need to know more, but consider the rest a bonus.


### Comparing with GNU and FreeBSD sed

`sed` offers one of the most commonly encountered differences between the BSD and GNU toolchains. On **Linux** you can substitute a line in a file like this:

    $ sed -i 's/Old/New/' $FILE

But this doesn't behave the same on **FreeBSD**, and by extension, **macOS**:

    ==> sed: 1: "$FILE": invalid command code

The reason is FreeBSD sed requires an extension for `-i`, as per the `manpage(1)`:

    -i extension
        Edit files in-place, saving backups with the specified extension.

So what you really want to do is this. Note the empty string after `-i`:

    $ sed -i '' 's/Old/New/' $FILE

### NetBSD sed

Like a schmuck, I assumed the same applied on NetBSD. If you do enough web searches, you get frustrated quickly that people assume all the BSDs are functionally equivilent. But when I used the FreeBSD syntax above, I got:

    ==> sed: s/Old/New/: No such file or directory

Not to get all Malcolm Gladwell on you, but *turns out* NetBSD behaves like GNU in this case, and using `-i` is sufficient:

    $ sed -i 's/Old/New/' $FILE

