---
title: "MDF disk images to ISOs"
date: "2020-06-04T08:37:47+10:00"
abstract: "You may not even need to convert, just append .ISO"
year: "2020"
category: Software
tag:
- disk-images
- mizuno-restoration
- nostalgia
- vitualisation
- windows
- windows-95
location: Sydney
---
I'm restoring the first computer I built when I was in primary school, and have been trying to locate the exact OEM version of Windows 95 I licenced along with the parts from Make Fine Computer in Funan Centre. I call out the name of the shop as a nostalgic homage, as they've long since closed down. ♡

Winworld and the Internet Archive have been *tremendous* resources for finding these images, but one version I downloaded came extracted to an MDF. It's an Alcohol 120% disk image that can't be burned to a CD on my Mac or BSD boxes, so I wanted to convert it an ISO.

It's easy enough with the surprisingly-named mdf2iso:

    # mdf2iso Win95_OSR25.mdf
        
    ==> mdf2iso v0.3.1 by Salvatore Santagati
    ==> Licensed under GPL v2 or later
    ==> Win95_OSR25.mdf is already ISO9660.

Sure enough, appending the `.iso` extension worked.

Lesson learned: try mounting MDFs as if they're ISOs first. If it isn't, use Salvatore Santagati's excellent utility. If only those awful `bin` and `cue` files were as easy.

