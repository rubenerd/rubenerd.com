---
title: "Goodbye tanakasuka, my last RAIDZ-1 ZFS pool"
date: "2019-05-14T19:21:05+10:00"
abstract: "More than four years of reliable service, now being upgraded and replaced."
thumb: "https://rubenerd.com/files/2019/tanakasuka@thumb.jpg"
year: "2019"
category: Hardware
tag:
- bsd
- freebsd
- hard-drives
- kyoani
- sound-euphonium
- zfs
location: Sydney
---
I'm deconstructing my oldest personal ZFS pool after more than four years of flawless service. It was built with 4× 3 TB WD Blue drives for Clara's and my Plex media backend, running on an HP Gen8 Microserver.

      pool: tanakasuka
     state: ONLINE
      scan: scrub repaired 0 in 17h57m with 0 errors on Thu May  9 10:59:20 2019
    config:

            NAME                      STATE     READ WRITE CKSUM
            tanakasuka                ONLINE       0     0     0
              raidz1-0                ONLINE       0     0     0
                diskid/DISK-BAY0.eli  ONLINE       0     0     0
                diskid/DISK-BAY1.eli  ONLINE       0     0     0
                diskid/DISK-BAY2.eli  ONLINE       0     0     0
                diskid/DISK-BAY3.eli  ONLINE       0     0     0

She's being upgraded with 2× 10 TB HGST drives in a ZFS mirror, for a few reasons:

* more capacity,
* performance,
* to free up two drive bays, and 
* because I trust mirrors over RAIDZ-1 for these larger drives.

Thanks FreeBSD, GELI, ZFS, Western Digital, and HP!

<p><img src="https://rubenerd.com/files/2019/euphonium-art@1x.jpg" srcset="https://rubenerd.com/files/2019/euphonium-art@1x.jpg 1x, https://rubenerd.com/files/2019/euphonium-art@2x.jpg 2x" alt="" style="width:500px" /></p>

And for those wondering about the name, it's a concatenation of Tanaka Asuka's name from *Hibike! Euphonium*, everyone's favourite bespekled tuba player. Kyoto Animation are known for their high production values and beautiful art, but their rendition of this series by Ayano Takeda and Nikki Asada was something else.

The official key visual above was drawn by Akaya Nagahama.

