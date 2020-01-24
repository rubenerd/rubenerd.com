---
title: "Curly quote fix coming for Hugo 0.6x"
date: "2020-01-21T21:49:37+11:00"
abstract: "A patch has been approved by bep, so hopefully we see in an update soon."
year: "2020"
category: Internet
tag:
- formatting
- gohugo
- markdown
location: Sydney
---
[Last December](https://rubenerd.com/curly-quotes-broken-in-goldmark-hugo/ "Curly quotes broken in Goldmark, Hugo") I mentioned that the Hugo static site generator broke curly quotes in the latest 0.6x branch, which meant I had to [hold back on 0.5x](https://github.com/gohugoio/hugo/releases/tag/v0.59.1) for Clara's and my sites. jkboxomine on the Hugo forums noticed on Sunday that a fix by flother [has been merged](https://github.com/gohugoio/hugo/commit/d3e8ab2e39dcc27853b163079f4a82364286fe82):

> This is the first version of Goldmark that supports all the Smartypants-style typographic punctuation transformations. Now, a straight single quote in the middle of a word is translated into a curly quote. Earlier versions leave them untouched. This brings Goldmark in line with Blackfriday.

This references [Yuin's recent work](https://github.com/yuin/goldmark#typographer-extension) adding support for this in Goldmark. Good job all, I'm keen to give this a try as soon as it's available :).

