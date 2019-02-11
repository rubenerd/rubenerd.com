---
title: "Fixed podcast descriptions in iTunes"
date: "2019-02-05T11:16:30+11:00"
abstract: "You can actually read them now!"
year: "2019"
category: Media
tag:
- ituntes
- podcast
- rss
- web-feeds
location: sydney
---
If you view my podcast episodes [in iTunes now], you see this:

> 26:45 – Light through leaves at night, life-work balance, ...

Rather than:

> Podcast: Play in new window | Download 26:45 – Light through ...

I added an extra auto-generated episode field in Hugo for the RSS summaries, rather than stripping the HTML. Overcast pulls information from the iTunes namespace fields as well, so this should work better.

Thanks for listening :).

[in iTunes now]: https://itunes.apple.com/podcast/rubenerd-show/id1003680071

