---
title: "Hidden TV Tuner metadata from last decade"
date: "2016-04-12T23:19:59+11:00"
abstract: "Ten Adelaide, NINE Digital, lots of other random stuff."
year: "2018"
category: Media
tag:
- elgato
- television
- tv-tuners
location: sydney
---
I recorded lots of television in the mid to late 2000s. Most of it was advertising for my sister's media course, but also lots of one off stuff.

Incidently, I blogged about the Elgato TV Tuner I used to do it, and it got my little blog here a mention on the company's press page. Pretty cool, I thought.

Fast forward almost a decade later, and I found a ton of these old recordings on a backup drive. I didn't have the heart to delete them, so I re-encoded them with avconv in as h264/aac to shave close to 90% of their space with no discernable difference in quality.

Running it through ffmpeg, I noticed something interesting. Each of these files had metadata, rught down to the original digital broadcast stations! Here was a file recorded from Channel 9:

    Input #0, mpegts, from '000000000ed96070.mpg':
      Duration: 00:02:06.26, start: 14817.417544, bitrate: 6649 kb/s
      Program 1105 
        Metadata:
          service_name    : NINE Digital
          service_provider: Nine Network
        Stream #0.0[0x200]: Video: mpeg2video (Main), yuv420p, 720x576 [PAR 64:45 DAR 16:9], 15000 kb/s, 25 fps, 90k tbn, 50 tbc
        Stream #0.1[0x28a](eng): Audio: mp2, 48000 Hz, 2 channels, s16p, 256 kb/s
        Stream #0.2[0x240](eng): Subtitle: [6][0][0][0] / 0x0006
      Program 1112 
        Metadata:
          service_name    : NINE HD
          service_provider: Nine Network

And here's one from Ten:

    Input #0, mpegts, from '0000000010569747.mpg':
      Duration: 00:02:20.34, start: 16243.436922, bitrate: 6002 kb/s
      Program 1617 
        Metadata:
          service_name    : ONE HD
          service_provider: Ten Adelaide
      Program 1621 
        Metadata:
          service_name    : TEN Digital
          service_provider: Ten Adelaide
        Stream #0.0[0x200]: Video: mpeg2video (Main), yuv420p, 720x576 [PAR 64:45 DAR 16:9], 9000 kb/s, 25 fps, 90k tbn, 50 tbc
        Stream #0.1[0x28a](eng): Audio: mp2, 48000 Hz, 2 channels, s16p, 256 kb/s (clean effects)
        Stream #0.2[0x240](eng): Subtitle: [6][0][0][0] / 0x0006
      Program 1623 
        Metadata:
          service_name    : ONE HD
          service_provider: Ten Adelaide
      Program 1624 
        Metadata:
          service_name    : ONE Digital
          service_provider: Ten Adelaide

And another from 7:

    Input #0, mpegts, from '0000000010627706.mpg':
      Duration: 00:02:02.60, start: 89862.635622, bitrate: 6851 kb/s
      Program 1360 
        Metadata:
          service_name    : 7 Digital
         service_provider: Seven Network
       Stream #0.0[0x501]: Video: mpeg2video (Main), yuv420p, 720x576 [PAR 64:45 DAR 16:9], 15000 kb/s, 25 fps, 90k tbn, 50 tbc
        Stream #0.1[0x502](eng): Audio: mp2, 48000 Hz, 2 channels, s16p, 256 kb/s
       Stream #0.2[0x504](eng): Subtitle: [6][0][0][0] / 0x0006
      Program 1361 
        Metadata:
          service_name    : 7 Digital 1
          service_provider: Seven Network
      Program 1362 
        Metadata:
          service_name    : 7 Digital 2
          service_provider: Seven Network
      Program 1363 
        Metadata:
          service_name    : 7 Digital 3
          service_provider: Seven Network
      Program 1364 
        Metadata:
          service_name    : 7 HD Digital
          service_provider: Network Seven

I wonder if those stations still exist, or with the same names, now?

