---
title: "Selectively disabling gohugo RSS feeds"
date: "2019-01-06T11:07:13+11:00"
abstract: "Can’t be done, but you can create empty templates."
year: "2019"
category: Software
tag:
- blogging
- feeds
- gohugo
- rss
- xml
location: sydney
---
The Hugo static site generator creates [four types of RSS feeds], for:

1. the whole site
2. each section, such as `posts` and `pages`
3. each taxonomy, such as `categories` and `tags`
4. each taxonomy value, such as the `weeb` tag

You can disable all of them, but you **can't pick and choose**. I'm not a Go developer, but if I were it'd be the #1 feature I'd request and help build.

I wanted feeds for my root site and for categories, but I didn't want for tags. My blog is almost old enough to be a learner driver, so has accumulated thousands of tags, which means as many superfluous RSS feeds.

My terrible hack to spare CPU cycles is creating an empty template for the taxonomies I don't want feeds for:

    $ touch ./layouts/taxonomy/tags.xml

Hugo's tag feeds will now be empty, save for an XML header. Then you can edit your web server configuration to 404 on these.

This one trick shaves between 10-15% off my build times.

[four types of RSS feeds]: https://gohugo.io/templates/rss/ "Hugo template documentation for RSS feeds"

