---
title: "Firefox disabling auto-playing video"
date: "2019-02-05T13:57:55+11:00"
abstract: "A victory for web sanity!"
year: "2019"
category: Internet
tag:
- firefox
- mozilla
- video
location: sydney
---
Chris Pearce reported the news in [Mozilla Hacks]\:

> Starting with the release of Firefox 66 for desktop and Firefox for Android, Firefox will block audible audio and video by default. We only allow a site to play audio or video aloud via the `HTMLMediaElement` API once a web page has had user interaction to initiate the audio, such as the user clicking on a “play” button.

This is great news, and a victory for web sanity! 

NoScript has had this feature since the beginning, and was the first extension to allow blocking HTML5's `video` and `audio` elements. If this is too blunt an instrument, you can also set `media.autoplay.default=1`  in `about:config` in the meantime.

A Twitterati asking me about this lead me to realise what's obvious or frustrating to me may not be to everyone. Some of us find autoplaying videos frustrating because they're unexpected, not user-initiated, and compete with other media we're playing. Until recently they were also notoriously difficult to track down if you had dozens of tabs open; at least now Firefox shows which tabs have playing audio. It's about returning user control.

[Mozilla Hacks]: https://hacks.mozilla.org/2019/02/firefox-66-to-block-automatically-playing-audible-video-and-audio/

