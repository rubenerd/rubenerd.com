---
title: "Hales fixes my RSS"
date: "2019-09-20T10:01:00+10:00"
abstract: "The problem I ahd with Hugo earlier this week also broke my podcast and RSS feeds. Thanks to Hales for being the first to spot it."
year: "2019"
category: Internet
tag:
- comments
- errors
- hales
- gohugo
- rss
location: Sydney
---
Last week I wrote about [Hugo 0.58 breaking pagination](https://rubenerd.com/fixing-hugo-pagination-in-0-58/) on some of the sites I maintain, including this one. Long-time contributor Hales of [Halestrom fame](http://halestrom.net/) was the first to spot my RSS feeds were also broken:

> Three empty articles, two of which born on January 1st. Your feed doesn't normally look like this :)

This is the Hugo loop in my `rss.xml` template:

    {{ range first 10 .Data.Pages }}

The [documentation now says this](https://gohugo.io/templates/rss/), which works:

    {{ range .Pages }}

Hugo does a great job of generating high-quality RSS feeds by default without any manual work, but I like to create my own for some custom namespaces and better [podcast support](https://rubenerd.com/feed/).

