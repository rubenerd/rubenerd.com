---
title: "Hugo generator deprecation warnings"
date: "2019-06-07T08:47:13+10:00"
abstract: "Use hugo.Generator to attribute your favourite static site generator, rather than .Hugo.Generator."
year: "2019"
category: Internet
tag:
- gohugo
- troubleshooting
location: Sydney
---
I credit [Hugo](https://gohugo.io "Official website of the Hugo static site generator") in my `partials/head.html` template with the following function. If you use software for free or donations, please consider doing so too:

    {{ .Hugo.Generator }}

But since January it's been throwing a warning:

    Building sites … $TIME WARN Page's .Hugo is deprecated and will 
    be removed in a future release. Use the global hugo function.

The [official docs](https://gohugo.io/variables/hugo/ "Hugo-specific Variables") still show this as the correct syntax. But [this forum thread](https://discourse.gohugo.io/t/pages-hugo-is-deprecated-as-of-0-55-0/17991/2) by @zwbetz suggests one should change it to:

    {{ hugo.Generator }}

This works without warnings. Note that it needs to be spelled lowercase, or you'll get a different error:

    Error: $FILE parse failed: template: $TEMPLATE:$LINE:
    function "Hugo" not defined

Or if you replace it with something completely pointless:

    Error: $FILE parse failed: template: $TEMPLATE:$LINE:
    function "BirdIsTheWord" not defined
   
