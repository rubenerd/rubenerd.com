---
title: "More flexible gohugo summaries"
date: "2016-07-30T14:19:10+10:00"
year: "2016"
location: Sydney
category: Software
tag: 
- gohugo
- static-site-generation
---
There was a genuine debate in the blogosphere era (remember that term?) surrounding the use of "read more..." links. Proponents claimed a page of summaries were easier to skim than entire posts, but detractors lamented the extra clicks involved to get to content.

Admittedly I used them sparingly in the mid 2000s for gigantic posts, but gradually phased them out after thinking most of the "above the fold" summaries I was writing were superfluous. Or in the words of Roxette, *Don't bore us, get to the chorus!*

<p class="aside" style="font-style:italic">(The irony isn’t lost on me that I dismissed an introduction in an introduction).</p>

<p class="aside" style="font-style:italic">(As I write this post in a Sydney coffee shop in 2016, they started playing Coldplay's Yellow, and blasted a very specific roasted bean smell that somehow transported me briefly to the Boat Deck Cafe in Adelaide in 2006. Back when we used the term “blogosphere”. Sugoi).</p>

Back to the present, I thought the summary and read more link pattern may be useful to hide some mildly <abbr title="not safe for work">NSFW</abbr> anime figure, series and art reviews I've have queued up since forever. Given the last time I used this feature was in mid-2000's WordPress, I had to check out how we do it in 2016 static site generators.

Hugo comes with the `{{ .Summary }}` method that returns content encountered before a standard <code style="white-space:nowrap">&lt;!-\-more-\-&gt;</code> comment, or 70 lines. I wanted to use the former, but avoid it doing auto summaries for posts where I don't have that comment defined. The code example in the otherwise excellent Hugo documentation included a `{{ .Truncated }}` boolean example, so I thought I could do this:

    <!-- Do not use this, included for reference -->
    {{ if .Truncated }}
        {{ .Summary }}
        <a href="{{ .Permalink }}">Read more..!</a>
    {{ else }}
        {{ .Content }}
    {{ end }}

Keen-eyed Hugoians will point out `{{ .Truncated }}` always returns true here, so the full `{{ .Content }}` will never be rendered. To Hugo, the post is either truncated by including the <code style="white-space:nowrap">&lt;!-\-more-\-&gt;</code> comment, or because Hugo returned the first 70 words.

The recommended workaround in the Hugo forums is to append <code style="white-space:nowrap">&lt;!-\-more-\-&gt;</code> at the end of all posts you don't want truncated, and include partway for those you do. So this post would have a read more link:

    ---
    [frontmatter]
    ---
    This is an introduction
    <!--more-->
    This appears after clicking Read more...

But this one wouldn't:

    ---
    [frontmatter]
    ---
    This is the entire post, without Read more..
    <!--more-->

So I eagerly ran `sed` across 4000+ posts to add this, but facing the gigantic `git status` I wondered if there was a solution that didn't rely on adding tons of superfluous markup. 

A great thing about Hugo (and Jekyll, to be fair) is how easy it is to define your own params for a post. So I defined "more" in the frontmatter of posts that need read more links:

    ---
    title: "Something" [..]
    more: true
    ---

So now in my theme I can say:

    <!-- This works --->
    {{ if .Params.more }}
        {{ .Summary }}
        <a href="{{ .Permalink }}">Read more..!</a>
    {{ else }}
        {{ .Content }}
    {{ end }}

You could probably do the same thing by detecting the presence of a more comment, but this works.

