---
title: "Remuxing old FLVs to MP4, without re-encoding!"
date: "2020-05-20T14:13:07+10:00"
abstract: "I didn’t realise many of these FLV files had MP4 in them already."
year: "2020"
category: Media
tag:
- bsd
- freebsd
- guides
- video
- youtube
location: Sydney
---
I'd routinely download YouTube videos for playback on my FreeBSD tower back in the late 2000s. Playing in the browser required Flash, and I didn't want to run the Linux compat libraries just to play video. I fear we're treading down the same path with DRM now officially part of the HTML specifications, but that's for another post.

Today I stumbled across stacks of these FLV videos in my backups, some from channels long since past. I contemplated converting them to MP4 before putting them onto Plex, and so I could get previews in file managers:

    $ ffmpeg -i "video.flv" "video.mp4"

But this log output caught my eye:

    Stream #0:0: Video: h264 (Main) ...    
    Stream #0:1: Audio: aac (LC) ...
    ... 
    Metadata:
      httphostheader  : v4.cache2.c.youtube.com
      encoder         : Lavf58.29.100

Sure enough, many of these videos *already had* MP4/H264 video and MP4/AAC audio; they were just in an FLV container. So it was just a matter of recontainerising/remuxing them by using ffmpeg's codec copy feature:

    $ ffmpeg -i "video.flv" -c copy "video.mp4"

A loop of a hundred videos took my HP MicroServer less than 20 seconds.

Not all of these videos could be processed this way; I saw a combination of fl1 and vp6f codecs reported in the video streams. Still, it was an fun exercise in nostalgia.

    Stream #0:0: Data: none
    Stream #0:1: Audio: mp3 ...
    Stream #0:2: Video: vp6f ...
    ...
    Metadata:
      metadatacreator : Manitu Group FLV MetaData Injector 2

