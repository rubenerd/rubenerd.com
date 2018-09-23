---
title: "Definition lists in markdown"
date: "2017-06-15T12:09:10+10:00"
year: "2017"
location: Sydney
abstract: "Not everyone thinks like Jeff Atwood"
year: "2017"
location: Sydney
category: Software
tag:
- markdown
- gohugo
- go
---
[Standard Markdown] doesn't have a provision for definition lists. It seems like an odd omission, given John Gruber uses them extensively on Daring Fireball.

The first search result for someone asking if its possible prompted this [delightful answer] by StackExchange co-founder Jeff Atwood:

> Ah yes, the totally useless \<dl\> and \<dd\> definition lists. I still don't see the point of these tags at all, but they are allowed in the HTML

This must be where StackExchage gets its cordial, constructive reputation.

Definition lists are valuable semantic tags. They codify a relationship between a term and a definition which plain CSS and divs can't. It's the reason why HTML5 has all these new tags like article, main, and navigation.

They're easy enough to write, though they get tedious once you're used to writing everything else in Markdown:

    <dl>
        <dt>Term</dt>
            <dd>Definition</dd>
        <dt>Term</dt>
            <dd>Definition</dd>
    </dl>

Fortunately, [Hugo] uses [Blackfriday] which I discovered today has an awesome definition list extension. Just like regular Markdown, is as easy to read in plaintext as its rendered form:

    Term
    : Definition
    Term
    : Definition

I love this. The colons are consistent with their use in written sentences, and they indent the text to aid readability.

[Standard Markdown]: https://daringfireball.net/projects/markdown/
[delightful answer]: https://meta.stackexchange.com/questions/72395/is-it-possible-to-have-definition-lists-in-markdown
[Hugo]: https://gohugo.io/
[Blackfriday]: https://github.com/russross/blackfriday

