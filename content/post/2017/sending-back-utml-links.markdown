---
title: "Sending back UTM links"
date: "2017-04-21T17:28:00+10:00"
year: "2017"
abstract: "utm_medium=shaddup"
year: "2017"
category: Internet
tag:
- spam
- urls
---
It really feels like a race-to-the-bottom for user tracking online. If you copy a link to send to a friend, or to write a blog post about, chances are you'll have a ton of [UTM spam] attached. 

They're bad for several reasons:

1. They're a usability nightmare. Suddently, messy URLs to copy and paste are made even worse. GET request attributes don't need to be in any order, so if you attempt to strip them off the end, you may inadvertedly remove a part of the required link.

2. They break the idea of canonical links. And no, `rel="canonical"` metadata links aren't the solution.

3. They persist when context changes. If you copy a link from email and paste on another carrier (Twitter, your blog, etc), "email" will still be listed as the source. 

Whenever a site includes a link with all this extra junk attached, I'm going to replace it with this:

    http://example.com/?utm_source=SPAM_VICTIM&utm_term=STOP_POLLUTING_URLS&utm_medium=NO_REALLY&utm_campaign=STOP_UTMS&utm_content=IS_EVIL

[UTM spam]: https://ga-dev-tools.appspot.com/campaign-url-builder/

