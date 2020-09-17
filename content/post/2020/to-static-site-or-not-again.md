---
title: "To static site, or not, again"
date: "2020-08-23T11:25:49+10:00"
abstract: "I'm not sure. Which probably means everything will stay the same."
year: "2020"
category: Internet
tag:
- gohugo
- static-site-generators
- weblog
location: Sydney
---
It's that time of year when I reassess whether I want to keep using a static-site generator, or go back to maintaining a hosted CMS. Those of you who've read my silly blog here over years have witnessed me thinking out loud about this *many* times.

It was an easier decision to [move back to a CMS](https://rubenerd.com/hello-world/) when I [generated the site with Jekyll](https://rubenerd.com/my-own-wordpress-to-jekyll-adventure/), on account of it taking half an hour to build my site. Optimisations and simplifying my themes cut this down, but it was still a barrier to me writing, which *defeats the entire point* of having a blog. Hugo now generates the entire site and any pushed updates in [a matter of seconds now](https://rubenerd.com/hugo-generating-content-in-memory/), so that concern is moot.

Ongoing maintenance is the other consideration. I shepherd enough servers at work and home to want to be on the hook for another stack, even though it did let me mess around with more frondend web development back in the day. In the last year though I've ended up running some Ghost blogs and Lychee photo hosting for friends and family, all of which could easily host my blog here too with minimal extra resources and time.

Ghost uses Node, which I have reservations about. But the UI and experience are *slick*, and having SQL makes batch editing posts fast. I log onto sites I maintain and immediately want to jump in and use it myself. That's the real reason for this post, if I'm being honest!

So really the only things keeping me here are momentum, and the fact my posts and themes are in version control. That last point is nice, not only so I can roll back mistakes and get a nice history of the site, but it also acts as a backup. But even then, I have backup scripts for the Ghost blogs I host that dump the databases and write out changed Markdown and XHTML files, back when I wanted insurance in case I wanted to go back to static sites.

I'm not sure. Which probably means everything will stay the same. Isn't that how it always goes?

