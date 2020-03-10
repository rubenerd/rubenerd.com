---
title: "CSS didn’t decouple content from presentation"
date: "2020-03-05T08:24:12+11:00"
abstract: "CSS saved us from stuff, but let’s not say it achieved something it didn’t."
year: "2020"
category: Internet
tag:
- css
- design
- language
location: Sydney
---
If you're in your late twenties or early thirties, you probably also grew up during the deprecation and removal of table-based layouts on websites. It was good these were discouraged; it was a clever hack at the time to create layouts, but it broke the original semantic meaning of the HTML table element, like trying to tap dance on one while others are trying to eat.

It also made accessibility *way* more complicated. One of the most eye opening experiences of my career was having Dave listen to my podcast at the time. He was legally blind, and reading my site through the same software he used let me appreciate how tedious and confusing most of the web was for him to use. I like to think I keep my HTML and web designs simple because I prefer it visually, but it's also because its the only ethical and responsible position to take. But I digress.

But more than just letting tables be tables again, CSS was billed as **decoupling content from presentation**. That phrase was repeated everywhere, from how-to guides to presentations.

The first problem was, styled div elements were not a replacement for tables. We now have [table-esque attributes](https://stackoverflow.com/questions/29229523/how-and-why-to-use-display-table-cell-css) and the [overengineered flex model](https://rubenerd.com/flex/), because *turns out* that while layouts weren't using tables as originally intended, they conveniently map to the visual model of columns and rows for layout. The 2000s were full of articles explaining how to hack&mdash;being the operative word&mdash;divs into doing what you wanted.

CSS was hamstrung by the available HTML elements at the time, and inconsistent browser support. But the fact it didn't ship with convenient and logical ways to declare table-like layouts from the start says all you need to know about the language's design.

I know, hindsight has 20-20 vision! But even at the time I thought this made no sense.

CSS and JavaScript are also as [tightly coupled](https://en.wikipedia.org/wiki/Coupling_(computer_programming)) to their HTML pages as plain HTML was to its inline styling before, albeit now in a separate file. Don't believe me? Check out the HTML source for a page, and tell me what the semantic meaning and requirement is for [hundreds of nested divs](https://twitter.com/Rubenerd/status/1234317877810888705) with attributes like *shadow* and *h3-hack*, if it's just content. There isn't any, it all comes down to supporting ever-increasing visual bloat.

CSS saved us from a ton of legacy problems, but let's not pretend it achieved something it didn't. This is still *very much* an unsolved problem.

