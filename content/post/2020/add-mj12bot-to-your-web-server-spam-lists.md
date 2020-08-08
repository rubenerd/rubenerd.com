---
title: "Add MJ12bot to your web server spam lists"
date: "2020-06-27T13:27:34+10:00"
abstract: "And a rabbit hole about this Majestic 12 UFO thing."
year: "2020"
category: Internet
tag:
- nginx
- web-servers
location: Sydney
---
Multiple sites I administer saw a huge uptick in spam from a so-called mj12bot last Monday afternoon, from at least a dozen separate IP addresses. I'm assuming the bot was named for the [Majestic 12](https://en.wikipedia.org/wiki/Majestic_12), a UFO conspiracy theory which may hold as much useful information as their site.

My FreeBSD and Debian cloud VMs all had hundreds of lines of these:

    [22/Jun/2020:16:55:16 +1000] "GET / HTTP/1.1" 200 29503 "-" \
    "Mozilla/5.0 (compatible; MJ12bot/v1.4.8; http://mj12bot.com/)"

I figured it was another Semalt situation, but just for fun I checked their site. It was immediately telling that most of the text went into describing how to reduce the requests from their bots. They explained how their service worked: 

> MJ12bot will make an up to 20 seconds delay between requests to your site - note however that while it is unlikely, it is still possible your site may have been crawled from multiple MJ12bots at the same time.

I had the same IP crawling my site more than three times a minute, so their 20-second delay claim is a lie. But even if it wasn't, such a claim is meaningless if multiple bots are free to do this concurrently. *We limit the number of people that can be on each bus to this nature reserve, but we don't limit the number of buses.*

I'm curious to understand the design decisions behind bots like this, and what they technically hope to achieve with these frequent requests. It'd be trivial to diff a day's worth of requests, realise that these kinds of sites are largely static and only change twice a day at most, and become more strategic with future requests. For bonus points they could observe the site only changes when the author is awake and writing in an Asia-Pacific timezone, so requests after those hours are pointless. They could check the TTL on the site's RSS feed. There's so much low hanging fruit here, but instead they decide to spam requests to such an extent that their activities illuminate in logs like a Christmas tree.

Don't bother with following their advise and adding their site to `robots.txt`, just block their useragents entirely, or better still tarpit them with nginx 444s. Some third-party nginx blocklists also have mj12bot.

