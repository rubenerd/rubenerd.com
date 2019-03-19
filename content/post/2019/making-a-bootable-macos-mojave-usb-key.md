---
title: "Making a macOS Mojave USB key"
date: "2019-03-10T18:18:33+11:00"
abstract: "More for me to remember, but also a reminder of how bad how-to sites are becoming!"
year: "2019"
category: Software 
tag:
- guides
- hot-garbage
- macos
- mac-os-x
- os-x
location: Sydney
---
1. Download *Mojave* from the Mac App Store.

2. Use *Disk Utility.app* or `diskutil(1)` to create a *GUID Partition Map* and format with *Mac OS Extended (Journaled)* on a target 8 GiB+ USB key.

3. Run these commands:

<pre>
$ cd "/Applications/Install macOS Mojave.app/Contents/Resources"
$ sudo ./createinstallmedia --volume /Volumes/YOURKEY \
      --nointeraction --downloadassets
$ echo The bird is the word, desu
</pre>

I always forget the syntax for this, and how-to sites are even more of an awful mess of newsletter sign-up lightboxes, JavaScript, downloaded fonts, notification requests, chatbot popups, and other hot garbage. The irony isn't lost on me that this conclusion was also *entirely* pointless!
