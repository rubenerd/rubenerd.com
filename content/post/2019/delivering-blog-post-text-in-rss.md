---
title: "Delivering blog post text in RSS"
date: "2019-02-17T09:20:07+11:00"
abstract: "I stick to description and excerpt:encoded."
year: "2019"
category: Internet
tag:
- rdf
- rss
- web-feeds
- xml
location: sydney
---
RSS may have been done and dusted a decade or more ago, but I've been thinking a lot about RDF again of late, and have been exploring some of its implementation. 

RSS 2.0—referred to as RSS henceforth for brevity—has a few methods for delivering textual payloads:

### The &lt;description&gt; attribute

This comes by default in RSS, and is defined in the [specification] as containing an "item synopsis". Most blogs I encounter include the entire text, including Dave Winer's who wrote this spec.

I follow the RDF/XML standard and include CDATA-escaped content as WordPress does, because it's cleaner:

    <description><!CDATA[[<p>Here’s an entire post.</p>]]</description>

But Dave Winer and other authors escape their HTML instead:

    <description>&lt;p&gt;Here&#x2019;s an entire post.&lt;/p&gt;</description>

### The &lt;content:encoded&gt; attribute

This is included in an [RSS 1.0 namespace], which you include with:

    xmlns:content="http://purl.org/rss/1.0/modules/content/

Its spec defines it as "an element whose contents are the entity-encoded or CDATA-escaped version of the content of the item." This renders it the same as &lt;description&gt; in practice.

    <content:encoded><!CDATA[[<p>Here’s an entire post.</p>]]</content:encoded>

I used to include a CDATA-escaped version of blog post text using this, but removed it because it duplicated how I used &lt;description&gt;.

### The &lt;excerpt:encoded&gt; attribute

This comes to us via WordPress, which you include with the below. It no longer resolves, though RSS only needs it as an identifier.

    xmlns:excerpt="http://wordpress.org/export/1.2/excerpt/"

This allows a post excerpt to be included alongside, and distinct from, the full blog post content. In practice it carries a CDATA-escaped payload, even if it rarely has more than plain text.

    <excerpt:encoded><!CDATA[[It's about zettai ryouiki.]]></excerpt:encoded>

I use it alongside &lt;description&gt; to provide an abstract, which I also feed into Schema, OpenGraph and Twitter description fields.


### The &lt;dc:description&gt; attribute

This comes from the [venerable Dublin Core], and is also referenced in the broader dcterms namespace. You include it with:

    xmlns:dc="http://purl.org/dc/elements/1.1/"

The spec makes it clear it "may include but is not limited to: an abstract, a table of contents, a graphical representation, or a free-text account of the resource." So arguably it overlaps the above.

    <dc:description><!CDATA[[It's about zettai ryouiki.]]></dc:description>

I leaned heavily towards using this, especially given I already use Dublin Core to ascribe authorship without leaking my email address as per the RSS specification. But &lt;excerpt:encoded&gt; appears more widely supported in feed readers from my own testing.


### Other namespaces

Podcast-specific namespaces including iTunes and Yahoo's abandonware MediaRSS define description attributes, presumably so they can be distinct from the blog post used to describe and download the content. These are beyond the scope of this post, but worth keeping in mind if you're specifically delivering podcasts or mixed content.

[specification]: https://cyber.harvard.edu/rss/rss.html 
[RSS 1.0 namespace]: http://web.resource.org/rss/1.0/modules/content/
[venerable Dublin Core]: http://www.dublincore.org/documents/dcmi-terms/#elements-description

