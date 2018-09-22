---
title: "ModernWebBloat.js"
date: "2018-08-15T12:01:05+10:00"
abstract: "Imagine, if you can, a smaller version of the web."
year: "2018"
location: Sydney
category: Internet
tag:
- design
- javascript
- privacy
- usability
---
[tedu's description] of the modern web—in the context of his miniwebproxy client—is beautiful:

> Imagine, if you can, a smaller version of the web. A web without dickbars, or scroll jacking, or chum boxes, or popup video, but still a web filled with informative articles about the 27 blockchains you need to be using right now. The good news is this web exists, but unfortunately your browser doesn’t connect to it by default. For that, you need the miniwebproxy. 

And this stereotypical use case, replete with a certain overused footer phrase:

> Some sites do some weird stuff. Ever read a medium post with some code snippets? Know how that works? First there’s an iframe. The iframe interior is an empty shell that sources some javascript. Then the javascript rewrites the iframe with love. miniwebproxy doesn’t believe in love, so it digs the code snippet out of the json and simply inserts it into the page.

And a bonus Chrome critique:

> Side note: it’s weird watching chrome in real time. Opening a new blank tab makes several requests back to the googship. Each and every new tab, boom, boom, boom, another wave of requests. Because maybe the newtab-serviceworker.js I downloaded thirty seconds ago has expired already? 

[tedu's description]: https://www.tedunangst.com/flak/post/miniwebproxy

