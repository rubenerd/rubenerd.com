---
title: "AC3 is not AAC"
date: "2020-09-30T10:04:05+10:00"
abstract: "Shocking nobody! Must have been looking at LaserDisc"
year: "2020"
category: Hardware
tag:
- aac
- audio
- music
location: Sydney
---
Speaking of silly mistakes, I was backing up some Cantonese DVDs for Clara and wondered why the resulting files were way larger than I expected.

    $ ls -lh *mkv
    ==> 653M Forensic Heroes - s01e07.mkv
    ==> 692M Forensic Heroes - s01e08.mkv
    ==> 953M Forensic Heroes - s01e09.mkv
        
    $ mkvinfo *s01e09*
    ==> [..]
    ==> | + Track
    ==> |  + Track number: 2 (track ID for mkvmerge & mkvextract: 1)
    ==> |  + Track UID: 2
    ==> |  + Lacing flag: 0
    ==> |  + Name: Stereo
    ==> |  + Language: chi
    ==> |  + Codec ID: A_AC3
    ==> |  + Track type: audio
    ==> |  + Audio track
    ==> |   + Channels: 2
    ==> |   + Sampling frequency: 48000.0

Whoops! I did AC3 passthrough, instead of transcoding. I must have been looking at my [LaserDisc demodulator](https://www.lddb.com/help/ac3rf/) before I ran that.

