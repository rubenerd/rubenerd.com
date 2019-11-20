---
title: "Site updates, late November 2019"
date: "2019-11-21T08:33:17+11:00"
abstract: "Running FreeBSD 12, back to building nginx myself, changed post date locations."
year: "2019"
category: Internet
tag:
- bsd
- freebsd
- nginx
- postgres
- rss
- weblog
location: Sydney
---
They say the shoemaker's children go barefoot. This sysadmin has been treating his own perosnal site and cloud servers a bit better, but they've been needing some TLC for a while. I've been [such a scrub](https://www.youtube.com/watch?v=2aLc3jEnLVs "TLC: No Scrubs").

* The main webserver has been upgraded from 11.x to 12.1. We're spoiled with `freebsd-update` and `pkg upgrade` now; aside from a minor config file conflict in a third party tool it was painless.

* I've gone back to building nginx myself rather than using packages. I can remove most of the stuff I don't use which reduces dependencies, and include `more_headers`.

* Post dates and categories are now directly under headings, rather than at the end of the post. I've had multiple people tell me they never saw them, so this hopefully makes it clearer.

* I've found a different RSS reader that uses Postgres as a backend instead, which I've enthusiastically adopted. MySQL has been fine, but I'm more familiar with Postgres. This will be in a future post.


