---
title: "Truncated to sixty pages"
date: "2018-08-11T11:12:34+10:00"
abstract: "Every post is still available, but pagination is limited?"
year: "2018"
location: Sydney
category: Internet
tag:
- errors
- hugo
- weblog
---
I updated Hugo, the static site generator, and for some reason only the first sixty pages are generated now, inclusive of the home page:

                       |  EN    
    +------------------+-------+
      Pages            | 14250  
      Paginator pages  |    59

I have no idea why. This weekend is pretty packed, so I won't be able to check any time soon. Every post in the [archives] are still available.

### Update: solved!

Three problems. First, you're allegedly not supposed to start sentences with numbers. Second, I was messing with git branches for each year of posts, and only 2018 was in the post folder to generate. And third, I generated the site again and got this:

    ERROR 2018/08/11 16:39:58 \
    Error: listen tcp 127.0.0.1:1313: \
    socket: too many open files in system

Well, then! I generated on my FreeBSD cloud instance instead, and now all the pages are restored.

                       |  EN    
    +------------------+-------+
      Pages            | 19330  
      Paginator pages  |   567  

I wonder if I'm hitting limits on my Mac with static site generation here?

### Update again: averted!

Somehow my git branches had recursively added folders into themselves twice, so the site was trying to generate from 10,000+ posts instead of 5,000. Deduping mitigated the error, but now I fear I'll hit it again in a few years.

[archives]: https://rubenerd.com/archives/

