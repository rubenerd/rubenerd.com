---
title: "Curly quotes broken in Goldmark, Hugo"
date: "2019-12-17T19:00:48+11:00"
abstract: "Stick with 0.59.1 for now if this sort of punctuation is important."
year: "2019"
category: Internet
tag:
- gohugo
- markdown
- troubleshooting
- weblog
location: Sydney
---
Hugo 0.60 has switched to using the Goldmark markdown generator. It [broke](https://discourse.gohugo.io/t/goldmark-commonmark-compliant-is-now-merged-and-the-new-default/21937/17) curly quotes and punctuation. It's a [known issue](https://github.com/yuin/goldmark/issues/39), and persists as of 0.60.1.

The official docs list these as options for your config file to enable support, or you can enable the old default markdown handler. But no combination of the below works:

    defaultMarkdownHandler: blackFriday

    markup:
      goldmark:
        extensions:
          typeographer: true
      blackFriday:
        angledQuotes: true

So stick with 0.59.1 if punctuation is important to you.

