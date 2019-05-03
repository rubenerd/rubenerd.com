---
title: "FreeBSD devd files need a .conf extension"
date: "2019-04-20T11:15:01+10:00"
abstract: "What the title says! Something I learned late last night."
year: "2019"
category: Software
tag:
- bsd
- devd
- freebsd
- orionvm
location: Sydney
---
<p style="font-style:italic" class="aside">An earlier version of this post referenced `.config` in the title, but `.conf` elsewhere in the post. The latter is correct, apologies for any confusion.</p>

I try my hardest to avoid clickbait titles, and my summaries that appear on Twitter tend to have the most pertinent part of the post spelled out. Today’s is no exception; you could legitimately take the title of this post and be done with it. Even this introductory paragraph is entirely pointless.

devd(8) is FreeBSD's elegant and fairly straight-forward system to respond to hardware changes with pre-defined events; the manpage(5) lists some [helpful examples](https://www.freebsd.org/cgi/man.cgi?query=devd.conf&sektion=5&n=1). The config resides below, with the usual conventions of ports and personal scripts appearing in the latter:

* `devd.conf`
* `/etc/devd/*.conf`
* `/usr/local/etc/devd/*.conf`

Seems simple enough. And yet, there I was late last night hitting my head on the desk because my shiny new test config files weren't being executed when hardware was live-attached or detached from my running OrionVM instances. I was triple-checking my devd syntax, digging into the documentation and newsgroup postings for when it was first developed. But as with so many problems of this nature, the solutions were nested but trivial:

* Config files need to have the `.conf` extension to be parsed, as my list shows above. My otherwise well-formed config files weren't, so they were being ignored. I know how they felt.

* Once you've added or changed a rule, you need to `service devd restart` or `service devfs restart` for them to be loaded, depending on what you're working on.

So if you find yourself troubleshooting these issues late at light, give these a try. Late at light? Late at night? Whichever. You may be surprised, and subsequently perform an embarrassingly nerdy dance before heading to bed.

