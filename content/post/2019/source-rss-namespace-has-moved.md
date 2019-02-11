---
title: "Source RSS namespace has moved"
date: "2019-02-02T22:58:59+11:00"
abstract: "Point your feeds to source.scripting.com"
year: "2019"
category: Internet
tag:
- atom
- dave-winer
- metadata
- namespaces
- rss
- web-feeds
location: sydney
---
Dave Winer's RSS `source` namespace has changed from:

    http://source.smallpict.com/2014/07/12/theSourceNamespace.html

To:

    http://source.scripting.com/

So better update your feeds if you use it.

Neither namespaces are listed on the [W3C RSS Validator namespace list], but it also hasn't been updated for more than a decade. The good news is our feeds no longer fail validation if they don't have the superfluous, self-referencing atom link.

[W3C RSS Validator namespace list]: https://validator.w3.org/feed/docs/howto/declare_namespaces.html

