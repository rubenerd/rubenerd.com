---
title: "Fixing Hugo pagination in 0.58"
date: "2019-09-12T10:44:45+10:00"
abstract: "Use site.RegularPages, not .Pages"
year: "2019"
category: Internet
tag:
- gohugo
- troubleshooting
- weblog
location: Sydney
---
The latest [Hugo](https://gohugo.io) static site generator version broke pagination for all my sites, including this one. This is how I previously filtered content so only posts would appear in pagination, as per the [documentation](https://gohugo.io/templates/pagination/#list-paginator-pages):

    {{ $paginator := .Paginate (where .Pages "Type" "post") }}
    {{ range $paginator.Pages }}

This now returnes a single page with the word *Posts* shown, and nothing else. I changed to the generic pagination method below and it worked, so the issue was with the above lookup.

    {{ range .Pagination.Pages }}

I saw [this thread](https://discourse.gohugo.io/t/site-not-working-after-updating-to-0-55/20664) on the Hugo forums, which had example code by funkydan2 replacing `.Pages` with `site.RegularPages`. This worked.

    {{ $pages := where site.RegularPages "Type" "post" }}
    {{ $paginator := .Paginate $pages }}{{ range $paginator.Pages }}

I broke the lookup out into a separate line to make it nicer, but you can just do a replace with the original documented code and it works.

Niggling changes like this aside, Hugo is still the best static-site generator I've ever used. I do miss the Liquid template system of Jekyll, but Hugo generates more than six thousand posts in seconds, as opposed to more than fifteen minutes. I wonder how much wasted power I've saved on remote servers since making the switch.

