---
title: "Markdown links have brackets backwards"
date: "2020-06-18T16:11:28+10:00"
abstract: "Or at least, I’ve always thought so"
year: "2020"
category: Software
tag:
- markdown
- markup
location: Sydney
---
Markdown has so many frustrating limitations, undefined behaviours, and incompatible implementations, but its utility *just* outweighs it all to still be useful in certain circumstances.

The order of link elements have always seemed backwards to me. This is a Markown link:

<pre>[link text](target "description")</pre>

And here's the equivilent HTML anchor:

<pre>&lt;a title="description" href="target"&gt;link text&lt;/a&gt;</pre>

Markdown is supposed to be human readable, so I agree that it makes it more sense to read the text for a link before its URL. We could debate all day about how XML/SGML got the order wrong where it should have put the URL and other attributes in the closing element, not the opening.

But to me, Markdown square brackets look mechanical and robotic, and rounded brackets look natural and human. So the machine code&mdash;aka, the URL&mdash;should be in the square brackets, and the human part should be in the rounded ones:

<pre>(link text)[target "description"]</pre>

I still instinctively reach for round brackets to start links like this, despite having written Markdown for more than a decade. It just makes more visual sense. Maybe I could start my own flavour called *Common(Sense)MarkII*.

While I'm here, I've since learned that American English refers to rounded brackets as *parentheses*. For a language seemingly hell-bent on dropping letters from colourful, flavourful words, it seems strange that an entirely new and superflous one would be invented and used. I guess that's the great thing about English, nowhere does it make sense.
