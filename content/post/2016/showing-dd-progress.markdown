---
title: "Showing dd progress"
date: "2016-05-23T15:30:00+10:00"
category: Infocomm
tag:
- software
- bsd
- freebsd
- linux
- netbsd
---
By default, dd doesn't show progress during block copying.

    # dd if=/dev/<source> of=diskimg.img
    ==> *crickets*

I’ve got around this with many approaches over the years, but today I even learned of a new way. Below is a list.

### Using PIDs, or killing dd midway and resuming

Technically possible, but ew. I leave as an exercise for the reader.

### Using dcfldd

dcfldd is a modified version of GNU dd developeed for the US DoD Computer Forensics Laboratory (DCFL). Its the easiest drop-in solution because it uses the same flags, but adds inline progress reporting.

    # dcfldd if=/dev/<source> of=disk.img

I’ve been using this since the mid 2000s. Unfortunately, I’ve since read warnings that it should be avoided as a general-purpose dd replacement, given it was forked from an old dd version that's since had bugs discovered.

### Using pv

pv reports stream data. Give pv a data source, and pipe it to dd to get a wonderful progress tracker:

    # pv -pterb /dev/<source> | dd of=disk.img

The flags show a progress bar (`-p`), timer (`-t`), ETA (`-e`), rate counter (`-r`) and byte counter (`-b`) respectfully. Or not respectfully; I don't care if you shout at your computer.

It's a less elegant solution to a drop-in dd replacement, but does keep to the UNIX philosophy.

### Using ddrescue

ddrescue is useful for copying block data off damaged disks. It operates by copying block-level data multiple times, trimming errors, and merging disparate sources into a more complete disk image.

It also shows a progress bar, and is happy to work on a clean disk:

    # ddrescue -d /dev/<source> disk.img disk.log

The `-d` flag is for direct disk access. Further use is beyond the scope of this post, but as an aside you can specify `-r2` to attempt reads twice on a problematic disk, very cool.

### Using GNU dd

Today I learned of an alternative in GNU dd: the progress bar. From dd(1):

> status=LEVEL  
> The LEVEL of information to print to stderr; 'none' suppresses everything but
> error messages, 'noxfer' suppresses the final transfer  statistics,  'progress'
> shows periodic transfer statistics

Mac and other BSD users can get this from the gnutil package, then use it as gdd:

    # gdd if=/dev/<something> of=disk.img progress=status

Normally I'm not a fan of the GNU extensions to standard POSIX tools, because we end up with incompatible options that break scripts. To that end, I'll likely keep using pv. But I'll secretly use gdd.

