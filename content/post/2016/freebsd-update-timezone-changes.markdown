---
title: "freebsd-update timezone changes"
date: "2016-12-13T09:05:00+10:00"
year: "2016"
category: Software
tag:
- bsd
- freebsd
- freebsd-update
- myanmar
- russia
- southeast-asia
- written-in-sydney
---
<p><img src="https://rubenerd.com/files/2016/barnaul.jpg" alt="Photo of Barnaul, by Andrew White on Wikimedia Commons" style="width:500px; height:313px;" srcset="https://rubenerd.com/files/2016/barnaul.jpg 1x, https://rubenerd.com/files/2016/barnaul@2x.jpg 2x" /></p>

The [freebsd-update] binary tool prints the files it will change after downloading. Of all the new goodies, I'm always most fascinated by the timezone changes:

    The following files will be removed as part of updating to 11.0-RELEASE-p5:
    /usr/share/zoneinfo/America/Santa_Isabel
    /usr/share/zoneinfo/Asia/Rangoon
    
    The following files will be added as part of updating to 11.0-RELEASE-p5:
    /usr/share/zoneinfo/Asia/Barnaul
    /usr/share/zoneinfo/Asia/Famagusta
    /usr/share/zoneinfo/Asia/Tomsk
    /usr/share/zoneinfo/Asia/Yangon
    /usr/share/zoneinfo/Europe/Astrakhan
    /usr/share/zoneinfo/Europe/Kirov
    /usr/share/zoneinfo/Europe/Ulyanovsk

So it looks like "Rangoon" was changed to "Yangon", a good thing I'd say based on the [history]:

> Yangon (ရန်ကုန်) is a combination of the two words yan (ရန်) and koun (ကုန်), which mean "enemies" and "run out of", respectively. It is also translated as "End of Strife". "Rangoon" most likely comes from the British imitation of the pronunciation of "Yangon" in the Arakanese language, which is [rɔ̀ɴɡʊ́ɴ].

The only other city I recognise is Barnaul, in south-central Russia. It has a pretty distinctive skyline, as shown by [Andrew White] on Wikimedia Commons.

[freebsd-update]: https://www.freebsd.org/doc/handbook/updating-upgrading-freebsdupdate.html
[history]: https://en.wikipedia.org/wiki/Yangon#Etymology
[Andrew White]: https://commons.wikimedia.org/wiki/File:Barnaulcollage.jpg

