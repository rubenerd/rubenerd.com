---
title: "RFC: Comment systems"
date: "2018-04-12T12:28:35+10:00"
abstract: "How should I enable blog comments here again?"
year: "2018"
category: Internet
tag:
- comments
- weblog
- written-in-sydney
---
This throwaway line on my recent post about [replacing social networks with RSS] generated some interest:

> And maybe… I need to re-enable blog post comments again.

But not for the reasons I thought. **Re-enabling** something **again** sounds like something [Yogi Berra would say]. It's completely superfluous to mention, unless I had disabled blog comments once before. Which I hadn't. So why am I even bothering to

@Georgina posted [this comment on The Twitters]\:

> @Rubenerd If you did enable comments on your blog again you’ll definitely see my face there on occasion 😉 Funnily enough I was reading a friend’s blog and she was not too chuffed about the growing number of monetised blogs, missing the days when people actually wrote about life.

That's a good point, I hadn't even considered all those paid blogs regurgitating the same stuff everywhere. In my head those aren't *blogs*, they're something else.

As for enabling comments, it raises a key concern: I statically generate my site, like a gentleman. It means my posts, themes, and other site assets are all in version control. I don't need databases or an interpreter or server-side caching to limit hits to the software; the pages themselves are the cache. But it limits what I can do.

If I wanted to enable blog comments again, there are really only two choices:

1. Implement something like Disqus on my static pages, which is reasonably the only game in town. I don't like this because I dislike JS, and I'm concerned about tracking. 

2. Run a CMS again. This is a big jump in terms of server requirements, and negates all the convenience and performance of static sites, but puts the code server-side where it belongs.

I'm torn. I'm leaning towards 2, but 1 would let me flip the switch today. Maybe I'd include 1, but have instructions on how to block it? Or research Disqus alternatives?

Or if I went with 2, what would I do? I'd want something that runs on Postgres at a minimum, but none of the popular blog platforms support it without potentially breakable shims. Or do I roll my own?

Loyal *Rubenerd* readers, whaddya reckon?

[replacing social networks with RSS]: https://rubenerd.com/replacing-social-networks-with-rss/
[this comment on The Twitters]: https://twitter.com/georgiecel/status/983500932506791936
[Yogi Berra would say]: https://en.wikipedia.org/wiki/Deja_Vu_All_Over_Again "Wikipedia disambiguation page for this Yogi Berra quote"
[Mojolicious]: http://mojolicious.org/
[Catalyst]: http://www.catalystframework.org/

