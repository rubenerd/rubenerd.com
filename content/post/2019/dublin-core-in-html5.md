---
title: "Dublin Core in HTML5"
date: "2019-01-31T21:14:13+11:00"
abstract: "A couple more steps back, but there are some mitigations."
year: "2019"
category: Internet
tag:
- dublin-core
- metadata
location: sydney
---
<p><img src="https://rubenerd.com/files/2013/dublin.jpg" alt="Photo of Dublin I took in 2010" style="width:500px;" /></p>

The [Dublin Core] schema is a set of vocabulary terms that can be used to add metadata to documents. It predates schema.org, and is widely [used in RSS], publishing, and academia.

I was adding Dublin Core metadata to an HTML5 page, and encountered a couple of problems with the W3C's [nu validator].


### "schema.DC not a registered keyword"

My pages included the following links which I've been using since the XHTML days:

    <link rel="schema.DC" href="http://purl.org/dc/elements/1.1/" />
    <link rel="schema.DCTERMS" href="http://purl.org/dc/terms/" />

But the nu validator claimed it had a "bad value schema.DC for attribute rel on element link: The string schema.DC is not a registered keyword." This seems like a glaring oversight or omission given the importance of Dublin Core.

There are two options here. You can remove the links to `schema.DC` and `schema.DCTERMS`, because their vocabularies are already known to HTML5. I prefer to codify what I'm using, so the other option is adding vocab prefixes:

    <head prefix="dc: http://purl.org/dc/elements/1.1
        dcterms: http://purl.org/dc/terms">

Then referencing Dublin Core metadata using HTML5's built-in RDFa property attribute:

    <meta property="dc:title" content="The Bird is the Word" />


### "The scheme attribute on the meta element is obsolete"

This validator error also took me by surprise. One could previously define the scheme of an attribute, like a data type:

    <meta name="DC.date"       scheme="DCTERMS.W3CDTF"  content="..." />
    <meta name="DC.identifier" scheme="DCTERMS.URI"     content="..."
    <meta name="DC.format"     scheme="DCTERMS.IMT"     content="..." />
    <meta name="DC.language"   scheme="DCTERMS.RFC1766" content="..." />
    <meta name="DC.rights"     scheme="DCTERMS.URI"     content="..." />

This was removed in HTML5, with the [unhelpful comment] that the "scheme attribute on the meta element is obsolete. Use only one scheme per field, or make the scheme declaration part of the value."

I'm confused. This *is* using one scheme per field. And how does one include the scheme declaration as part of the value?

[This forum poster] suggested there wasn't anything to worry about because "parsers do a pretty good job". Bluntly, this is insufficient, especially given we could unambiguously express the type before.

If it weren't for the beautiful `srcset` attribute, I'd probably still be doing things in XHTML+RDFa land. The *run fast and break things* approach to HTML5 still worries me a bit. *Se a vida é.*

[nu validator]: https://validator.w3.org/nu/
[This forum poster]: https://forums.squiz.net/t/meta-tag-schema-obsolete-in-html-what-to-use-instead/8371/2
[unhelpful comment]: https://w3c.github.io/html-reference/meta.html
[used in RSS]: https://rubenerd.com/replacing-rss-author-with-dublin-cores-dccreator/
[Dublin Core]: http://dublincore.org/

