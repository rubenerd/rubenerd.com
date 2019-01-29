---
title: "Feedback on static comments"
date: "2018-04-21T08:46:08+10:00"
abstract: "Thanks to X Y Z!"
year: "2018"
category: Internet
tag:
- comments
- weblog
location: sydney
---
Last Thursday I put out an <abbr title="request for comment">RFC</abbr> on comment systems, and how I'd include them again on this statically-generated blog. I got some great feedback! 


### Here's the thing: *don't do it*

I sensed a theme in many of the comments. I'll let Daniel W. summarise much of the sentiment:

> For the love of god, DON'T DO BLOG COMMENTS!

His argument was that the world has become even less civil and more spammy since I turned off blog comments here years ago, and that I'm not missing much.

At the time I argued spam had got too much, but I also disabled comments for all the unhelpful people who couldn't see the forest for the trees. It was frustrating getting mired down in pointless minutea when the broader point of a post was being ignored.

Specifically about anime, Daniel continued:

> Blogging about anime in 2018, [that's a paddlin']. People shitpost you for **everything** and think they are clever. It's so tiring. Fuck that.

Anime/otaku/weeb stuff was always a side show here, so I never had the noteriety or internet fame to attract those sort of comments. But who knows now? 

Your comments have been heeded! Thank you for putting some perspective on this.

[that's a paddlin']: https://simpsonswiki.com/wiki/That's_a_paddlin' "Simpsons wiki explanation"


### The third way

But what if I want to go in full tilt and enable comments here? My concern was I had two choices: go back to a dynamic CMS, or include a JavaScript client like Disqus. I didn't like either.

Turns out, there's a third way I hadn't considered: accept comments with a web form, backed by a script that appends them to the right post, and regenerates the site. Huge thanks to Jim Kloss from [Whole Wheat Radio], and William Hales from [Halestrom] for cluing me into this now obvious idea, and for taking the time to dive into it.

I love it for a few reasons:

* It keeps the site static, which means fast and easy.

* I can write the scripts I need in Perl, still my first love after all these years and many other languages later. Or even shell scripts, as William suggests.

* I can use a FreeBSD jail and rate-limit on IPs to keep spam down, or even queue posts for me to release manually every few days.

From Jim's email:

> If comments are just data appended to the original static data, the issue is how to append data as though you had included it in the original data.  You receive additional data (comments) and type at the bottom of the original data.  So the question (I assume) is how/where to collect the data and then automate the typing.  Could you have a “drop box” where data could be deposited on your site then a cron-like task that tacks it onto posts?  How would the new data be identified so it gets tacked onto the correct post?  How could the depositing of this additional data be made a fun and safe process for the writer?  Could you just collect comments from Twitter, email, drop box, phone messages, audio, etc. and append them?  Something even more creative ... a global blob where ALL comments are gathered, unassociated with their original, except for however the reader/commenter wants to join them in their own mind?  FUN!

Merci! He's in France right now :). It would require me to generate the site on the server, rather than locally and push with rsync. But that's a long overdue change anyway, so I could see this working.

For those who didn't know Whole Wheat Radio, Jim knows all to well the idea of a drop box system; WWR had this awesome feature where you could call in phonegrams that would be queued and played live on the air.

[William's blog post] was similarly amazing, with screenshots and stores of hidden bodies. He implemented a static site comment system on Haelstrom, and even thought through the issues with spam and abuse. The whole thing is worth a read, but these were my favourite lines:

> Ruben Schade is asking for advice about adding a comment system to his blog? You fool! I'm only too willing to give it.
> 
> Suggested solution: write a small .cgi script that handles accepting comments and generating .html files containing nothing but them. Then [iframe] or similar them in to your main pages, so you don't have to modify your main pages (or touch your vcs) when a comment gets added.
> 
> Until then: don't throw databases at problems your filesystem will happily solve.

[Halestrom]: http://www.halestrom.net/

[Whole Wheat Radio]: https://en.wikipedia.org/wiki/Whole_Wheat_Radio "Wikipedia entry on Whole Wheat Radio"

[William's blog post]: http://www.halestrom.net/darksleep/blog/030_comment_blog_systems/ "Meta: Blog comment systems"


### Using this as an exercise

I realised while writing this post that soliciting comments and getting email had been a fun exercise itself. Maybe I'm overthinking this, and I should just keep it there.

The main downside there is people may not be enthusiastic about commenting if they either need their own blog to link back to mine, or to write me an email. But as Jim says:

> I read you daily and have frequent knee-jerk reactions to comment – and therefore sorta appreciate not being able to comment because by now I’d have made a fool of my myself

I don't think there was ever a risk of that :).
