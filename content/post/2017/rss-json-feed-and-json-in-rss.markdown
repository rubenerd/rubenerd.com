---
title: "JSON Feed, and JSON in RSS"
date: "2017-07-08T10:24:00+10:00"
abstract: "When the web syndication wheel was reinvented, again"
category: Infocomm
tag:
- internet
- atom
- dave-winer
- rss
- json
---
The world of web syndication seemed to have settled over the last decade, but there have been a couple of interesting developments in the last few months.


### Some background

The open web is made possible with syndication feeds. The big games in town can be broadly split into four camps:

* Scraping a page to get content, or using site-specific APIs. We mostly got over this, but social networks have reverted to this to keep you on their sites.

* The RSS 1.0 family, which uses RDF. The idea was the Dublin Core and other namespaces had already done the painstaking work of defining attributes, so you could just use them. The downside was, without any *de jure* standard attributes, it was incumbent upon feed readers to reconcile disparate namespaces to present a standard interface to users.

* RSS 2.0, as championed by Dave Winer. It included simplified list of standard attributes, which could be extended with namespaces. It was the first to support podcasting, and is still the most compatible. I used to prefer 1.0 because of my preference and interest in RDF, but have long since stuck with 2.0.

* Atom, which was unironically created in part due to there being too many syndication formats. It also fixed a few issues, including date formatting.

Aside from point 1, the assumption was we'd be dealing with XML, or something close to it. But this may now be changing.


### JSON Feed

Brent Simmons and Manton Reece introduced [JSON Feed] in May:

> …  JSON has become the developers’ choice for APIs, and that developers will often go out of their way to avoid XML. JSON is simpler to read and write, and it’s less prone to bugs.

I don't write software full time, so I defer to their expertise about developer's choice.

That said, I've never had a problem with parsing RSS feeds in my Perl and Ruby scripts. Import a CPAN package or a gem, and I'm done. There are poorly formatted RSS feeds I need to fix with some regex, but I reckon the same would happen to an extent with JSON too.

I guess it would come down to opportunity cost. If you're already ingesting and working with JSON, being able to naturally extend this to syndication would make sense.


### RSS in JSON

Around the same time Brent and Manton were working on the JSON Feed spec, Dave Winer released [RSS in JSON]: 

> It's simply an RSS 2.0 feed that uses JSON syntax in place of XML.

Admittedly, this is what I thought JSON Feed was, before I read the incompatible spec. If a dislike of XML and a preference for JSON were the two reasons, RSS in JSON would seem to be the logical choice.

I'll be implementing it on *Rubénerd* as an interesting project, but as [Dave professed] when he first checked it out in 2012, I'm not sure if it'll really be used.

[JSON Feed]: https://jsonfeed.org/
[RSS in JSON]: https://github.com/scripting/Scripting-News/blob/master/rss-in-json/README.md
[Dave professed]: http://scripting.com/2017/06/05.html#a080624

