---
title: "The Rubenerd Show is back on iTunes"
date: "2017-05-11T11:01:00+10:00"
abstract: "Thanks to Apple for their help."
year: "2017"
category: Media
tag:
- apple
- itunes
- podcasting
location: sydney
---
Many of you repoted issues accessing the *[Rubenerd Show]* earlier this year. Overnightscape Underground [master feed] subscribers were fine, but iTunes was returning this erroneous error when people were accessing this show directly in iTunes:

> "Item Not Available: The item you've requested is not currently
> available in the Singapore/[Country] Store, but it is available
> in the Australian Store. Click Change Store to view this item."

Assuming you even had an Australian store account though, you'd get this:

> "The item you've requested is not currently available in the Australian store.

Not to get all Merlin Mann on you, but **turns out** there were a few issues with the show feed that have since been fixed, and it had nothing to do with geography. Well, other than our bungled NBN, but that's a separate issue.

The feed is now fixed. Most podcast clients were fine during this, but I noticed Overcast removed the feed when iTunes did; Marco must poll iTunes. His permalinks still handle [accented characters] poorly, but it doesn't cause listening issues.

I've set up a redirect, but if you subscribed to the feed manually and are no longer getting shows, please update your client to point here instead:

    http://showfeed.rubenerd.com/

### Fixing the problem

I wanted to give a big shoutout and thanks to Chel and Hahn from the Podcasts Connect support team at Apple for putting me on the right track. For those facing a similar issue with older shows, these are what I had to address:

1. iTunes now supports HTTPS delivery of audio and the RSS feed (nice), but the latter can't be served with Let's Encrypt (darn). I'm now serving the show feed on a separate, HTTP subdomain.

2. The minimum show art size has been bumped up to 1400x1400. I set mine at the maximum 3000x3000 to stave off the next necessary jump.

3. At some point, I'd clobbered my RSS iTunes tags such that they weren't nested properly. This was nobody's fault but my own! Double and triple check your iTunes tags, then get a cup of coffee, and check again. They look okay? No, really, check again.

4. How are those iTunes tags looking?

Thanks for listening, hiven glaven.

[Rubenerd Show]: https://rubenerd.com/show/
[master feed]: http://onsug.com/feed/
[accented characters]: https://overcast.fm/itunes1003680071/rub-nerd-show

