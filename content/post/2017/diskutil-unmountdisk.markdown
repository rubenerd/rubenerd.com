---
title: "diskutil unmountDisk"
date: "2017-04-21T16:14:00+10:00"
abstract: "So much easier than multiple unmounts."
category: Infocomm
tag:
- software
- apple
- guides
- mac-os-x
- macos
- os-x
---
I was running a QEMU lab on my Mac, and needed raw disk access to a USB device with multiple partitions. QEMU needs these partitions unmounted on the host before they can access them, for good reason. I tried writing on the same paper as a friend was in real time once, it ended up a huge mess.

The graphical approach is launching Disk Utility.app and unmount each partition, at least for as long as Apple lets us do so graphically before they remove this feature in their [next bout of short-sightedness].

From the shell, you can use BSD's standard umount:

    # umount [volume1]
    # umount [volume2]

Though diskutil is the preferred macOS approach:

    # diskutil unmount [volume1]
    # diskutil unmount [Volume2]

This is tedious for multiple partitions without easily-iteratable names. So I thought I'd be <del>a smartarse</del> dumbarse and unmount the root volume:

    # printf "%s\n" "Right about now, the funk soul brother"

... that was clearly the [wrong snippet]. 

<iframe width="500" height="281" src="https://www.youtube.com/embed/nmsTwQb1csc" style="border:0;"></iframe>

Check it out now, the funk soul brother:

    # diskutil unmount /dev/diskX
    ==> disk2 was already unmounted or it has a partitioning
    ==> scheme so use "diskutil unmountDisk" instead

Hey, wait a minute. There was an argument for this, the *entire time?*

    # diskutil unmountDisk /dev/diskX
    ==> Unmount of all volumes on diskX was successful

From the manpage (8):

> `unmountDisk | umountDisk [force] device`  
> 
> Unmount all volumes on the given partition map; that is, an unmount is 
> attempted on the directly-mountable volume, if any, on each of the whole 
> disk's partitions. However, "virtual" volumes, such as those are implied 
> by e.g. Core Storage Physical Volumes, AppleRAID Members, etc., are not 
> handled. Force will force-unmount the volumes (less kind to any open 
> files; see also umount (8)).  You should specify a whole disk, but all 
> volumes of the whole disk are attempted to be unmounted even if you
> specify a partition.

Boom! Much easier.

[next bout of short-sightedness]: http://www.macworld.com/article/2987201/operating-systems/hands-on-with-disk-utility-in-el-capitan-tool-for-storage-devices-gets-a-facelift.html
[wrong snippet]: https://www.youtube.com/watch?v=nmsTwQb1csc

