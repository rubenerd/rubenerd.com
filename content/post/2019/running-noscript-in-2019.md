---
title: "Running NoScript in 2019"
date: "2019-08-01T17:37:55+10:00"
abstract: "Going back reminded me how slow and bloated the modern web is."
year: "2019"
thumb: "https://rubenerd.com/files/uploads/anime.firefoxtan.270233.png"
category: Software
tag:
- firefox
- javascript
- noscript
- security
location: Sydney
---
I stopped using the [NoScript Firefox plugin](https://noscript.net/) a couple of years ago, for the reason people on social media threw at me for thirteen years: it broke too many websites. The approach for using it goes like this:

1. Go to a new website
2. See a badly designed fallback with missing content
3. Scroll NoScript's giant list of third-party sites
4. Try the top level domain, and maybe other sane ones
5. Refresh
6. If still doesn't work, repeat 4-5.

I got it down to a science, but eventually the modern web wore me down.

Or so I thought. Because the difference between NoScript and just using uBlock Origin feels the same as going from uBlock Origin to no filtering at all. Your first impression is how much *slower* websites are while you wait for content to load you either didn't need, want, or ask for. I wouldn't say I can do the white-list dance in less time than it takes for an untouched page takes to load, but I get *awfully* close.

So I reinstalled it on a fresh new Firefox profile. Aside from the obvious junk this blocks, I've also been alerted to three <abbr title="cross site scripting" style="border:0; text-decoration:none;">XSS</abbr> requests, all by large companies that should know better, one of which starts with *M* and ends in *icrosoft*. I'm looking at you, *Volume Licence Service Centre.*

I concede NoScript involves a active role in web management than a set-and-forget tool like uBlock Origin or PrivacyBadger doesn't. It's not difficult, but it requires a lot of time, especially when you first start training it on sites you frequent. But if you're like me and feeling increasingly fed up with what the web is turning into, the worst you could do is try it and uninstall if it's not your cup of tea.

