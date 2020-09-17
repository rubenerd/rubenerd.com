---
title: "Firefox’s situation reminds me of OpenSSL"
date: "2020-08-31T12:02:27+10:00"
abstract: "We’re all perilously close to a browser monoculture again, which like OpenSSL could explode in our faces."
year: "2020"
category: Software
tag:
- firefox
- google
- openssl
- security
location: Sydney
---
In 2014 a simple but critical [OpenSSL vulnerability was disclosed](https://rubenerd.com/the-openssl-heart-bleeds/), affecting the security of hundreds of millions of websites. We rapidly realised the entire industry had come to depend on this one underfunded, understaffed, and underappreciated community to maintain this critical piece of Internet infrastructure. Companies and the wider community committed to funding its future development, and other projects also adopted its codebase.

The latest layoffs at Mozilla hint at a similar situation, though fewer people are talking about it.


### How we got here

It's hard to overstate Firefox's role in the creation of the modern web. Mozilla didn't just offer an alternative browser bourne from the ashes of Netscape Navigator and the Mozilla Suite; it ended the dark, monoculture days of IE. This had two effects:

1. Broad web standards could be proposed and put into practice because no one player owned or dominated the conversation.

2. Developers got back into the habit of testing sites against multiple rendering engines, and justifying to their managers that it was necessary.

Now we're faced with every major browser being built upon WebKit and its derivatives like Blink (referred to as WebKit here for the sake of brevity). Microsoft went as far as saying they weren't judging their Edge browser on standards compliance, but whether it rendered the same as WebKit. Now it also just runs Blink, the same engine behind Chromium, Chrome, Opera, Naver Whale, Vivaldi, and others.

In other words, we're *perilously* close to a monoculture again. There are a few important differences this time, but I fear they're overstated.


### Why it's the same, again

The most argued point is that WebKit is a better shepherd of open standards than IE was. This is true, but while Google and Apple weren't pushing us to use ActiveX or Silverlight, they aren't above unilateral action either. AMP, [mandatory HTTPS](http://this.how/googleAndHttp/), shorter certificate durations, and platform exclusivity have been dictated outside independent standards bodies, thanks to their market reach and clout. And let's not forget Google bafflingly tried to argue that Android was more open because it [included Flash](https://rubenerd.com/google-flash-not-open/), another proprietary browser extension. The use of this tech as a marketing bullet point set back its deprecation years.

But what about innovation and compatibly? WebKit has dozens of browsers targeting multiple platforms, whereas IE kept so many sites tied to Windows. I remember the dark days when I had to keep a Windows 2000 VM so I could log into my Singaporean banking site. Yet these new these companies also have their own ambitions: Google's ad-driven business model gives it a powerful ulterior motive to hamper meaningful progress in online privacy.

Cross-engine testing is also slowly, but noticeably, feeling like a lost cause. It's as though I've gone back twenty years, only this time I'm told to "just" download Chrome instead of IE. Or worse, sites simply don't work. I'm right back there again spoofing my useragent, with memories of Lou Bega playing through Winamp, and my Palm Treo buzzing on the desk next to my school work. This isn't progress.

The web depends on Firefox more than it realises, just as it did and does with OpenSSL. And we risk forgetting again at our own peril.

