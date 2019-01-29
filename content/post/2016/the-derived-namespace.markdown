---
title: "The derived namespace"
date: "2016-08-13T09:50:00+10:00"
abstract: "An add-on to RSS 2.0 to provide context about the source of textual media."
year: "2016"
category: Internet
tag:
- feeds
- rss
- xml
location: sydney
---
The *derived* namespace is an add-on to RSS 2.0 that provide context about the source code for textual media. 

At the moment there's one attribute, used like this:

    <derived:code type="text/markdown" 
        url="[github repo]/master/content/post/2016/thirty.markdown" />

Multiple attributes with different mime-types could be used, though having a single canoncial source is strongly encouraged.

### Why?

Like many sites, *Rubenerd* is written in Markdown and pre-rendered for clients in HTML. This link means smart clients could take the original markdown source, and render it for their specific viewport or client.

Facebook have shown with their "stories" feature that there's demand for refactoring/optimising content. I want the same ability for the open web using standard RSS.

### How is this different from Dave Winer's source namespace?

Good question. Dave's [source namespace] includes the outline attribute, but that carries an implication that the source is an OPML or similar outline. I wanted an attribute that linked directly to the original source, regardless of structure.

If Dave wanted to extend source to include a <code>sourceCode</code> attribute, for example, I'd happily depracate.

I've never proposed an extension like this before, but there's a first time for everything : )

[source namespace]: http://source.smallpict.com/2014/07/12/theSourceNamespace.html

