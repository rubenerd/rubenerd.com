---
title: "Monochrome EMM386 memory with Windows 3.1x"
date: "2015-11-28T10:34:00+10:00"
summary: "Using the monochrome area may need another Windows driver"
category: Software
tag:
- dos
- memory
- nostalgia
---
It's the weekend, so time to break into some more nostalgic DOS fun. Because I was born in the 80s, grew up in the 90s, and spend my spare time doing things I love rather than mocking people who revel in archaic technology. Yes, it's at the point where I even need to defend myself from trolls before I even start, darn.

### A brief history of high memory, XMS and EMS

Due to the 640K conventional memory limitations of DOS, more memory couldn't be accessed without tools like EMM386 or QEMM. Loading these in CONFIG.SYS would yield upper memory blocks, extended memory (XMS) and, if required for older applications, expanded memory (EMS).

The conventional (HAH!) wisdom at the time was to default to XMS with the NOEMS flag in EMM386, and only expose EMS with the RAM flag if required by your application.

    ; Only use XMS
    C:\DOS\EMM386.EXE NOEMS /I=D000-EFFF /VERBOSE
    ; Make EMS available when required
    C:\DOS\EMM386.EXE RAM /I=D000-EFFF FRAME=D0000 /VERBOSE 

The mode you're operating in could be confirmed by running MEM and checking for the presence (or lack) of EMS lines. In MS-DOS 6.20 (the version we ran on my childhood computer and we still have the disks for!), MEM reports this in EMS mode:

    Total Expanded (EMS)    33,152 (33,947,648 bytes)
    Free Expanded (EMS)*    32,768 (33,554,432 bytes)

    * EMM386 is using XMS memory to similate EMS memory as needed.
      Free EMS memory may change as free XMS memory changes.

### The monochrome memory area

A commonly exploited trick to get more upper memory was to define extra ranges beyond what the tools of the day could detect. For those of us in VM environments that emulate VGA cards, we can use one of the memory ranges reserved by DOS for monochrome displays. These are the areas shown  in the above example.

My dad and I used this successfully on our family machine with Windows 3.0, then 3.1, for years. I since learned from various forums that some SVGA drivers for these early Windows versions use the monochrome area for extra memory or buffer space.

In the case where this happens to you, you can remove that range from your extended memory manager. Alternatively, Microsoft provided the MONOUMB.386 driver on their BBS (wow), which various forums have made available. When I get my retro drivers site up, I'll link to it here too.

To use, copy the driver to your Windows system folder, and append the [386Enh] lines to your WIN.INI:

<p><img src="https://rubenerd.com/files/2015/screenie.winini.monoumb.png" alt="device=c:\windows\system\monoumb.386" style="width:500px; height:250px;" /></p>

This is now part of my standard DOS configuration, even though technically I don't think I've ever needed it. Guess it can't hurt.

Which reminds me, at some point I should share my DOS orchestration scripts. I called the controller ANSIBLE.BAT for shits and giggles, though I suppose PUPPET.BAT could have also worked. SALT.BAT just sounds breakable.

