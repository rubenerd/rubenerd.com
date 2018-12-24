---
title: "FaceID"
date: "2017-11-22T08:54:24+11:00"
abstract: "I have reservations, surprising nobody!"
year: "2017"
category: Hardware
tag:
- apple
- security
- authentication
- privacy
- phones
- written-in-sydney
---
I haven't done a thinking out loud post for a long time, where I scrawl out my ideas in one continuous stream then revisit it later.

TouchID came in the iPhone 5, and unsurprisingly, I was skeptical. My principle concern was passwords can be changed, but your fingerprint can't be. If your fingerprint data was leaked, any sufficiently motivated actor could access any current or future device you lock with this, and short of sandpaper there's no way to revoke it.

I came around to it for the same reason we all did: convenience. I had been using the alphanumeric keypad to enter passwords on previous iPhones, and it was such a pain, I moved back to numbers. TouchID meant I could have a more secure input method for day to day use. 

FaceID in the iPhone X is the next level up, and I'm not satisfied it's mature enough. Within its first month of real world use, there are already reports of white hats fooling the system with face moulds, or with similar enough family members. 

If this sounds like the arguments against TouchID, bear in mind your face is public to an extent your fingerprint is not. 3D facial reconstruction from 2D images is already old hat. Obtaining fingerprints surreptitiously and creating an analogue is possible, but arguably more complex.

<p><img src="https://rubenerd.com/files/2017/animu_katou_megumi_saenai_heroine_no_sodatekata_drawn_by_misaki_kurehito@1x.jpg" srcset="https://rubenerd.com/files/2017/animu_katou_megumi_saenai_heroine_no_sodatekata_drawn_by_misaki_kurehito@1x.jpg 1x, https://rubenerd.com/files/2017/animu_katou_megumi_saenai_heroine_no_sodatekata_drawn_by_misaki_kurehito@2x.jpg 2x" alt="" style="width:500px" /></p>

<p style="font-style:italic">Official art above is from <strong>How To Raise a Boring Girlfriend</strong>, which seemed oddly appropriate for this post.</p>

We're in the early days of attacks against FaceID, but they will only keep getting better. The next 12 months will be interesting to watch.

Meantime, I'm sure Apple is working on higher resolution cameras and other technical measures to thwart attacks like this. They already claim to scramble the order your face is scanned for each device. If a mobile phone manufacturer can pull off implementing a secure system, I trust Apple over anyone else based on their [track record and motivations].

I also don't entirely buy the line that FaceID only exists to remove a home button. Granted it was necessary for that new design, along with a [regrettable shift to OLED], but its reasonable to assume they would have implemented this feature regardless. Apple has billed this as more convenient auth.

I guess it comes back to those two key words: "sufficiently motivated." 

You can be reasonably confident that any locking device on a phone already provides a sufficient barrier to entry for most people to bother, and chances are a stolen iPhone X is more valuable to immediately resell than to go through the process of breaking it for data mining. But for high profile targets, or those dealing with secure data, it's something to keep in mind.

[track record and motivations]: https://qz.com/1131515/google-collects-android-users-locations-even-when-location-services-are-disabled/
[regrettable shift to OLED]: https://rubenerd.com/oleds-suck/

