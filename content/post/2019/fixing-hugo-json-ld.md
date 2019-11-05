---
title: "Fixing Hugo JSON-LD"
date: "2019-10-13T10:36:56+11:00"
abstract: "Don’t wrap your function calls in double-quotes now."
year: "2019"
category: Internet
tag:
- gohugo
- static-site-generators
- troubleshooting
location: Sydney
---
Just after I fixed other problems, the latest Hugo static site generator broke my JSON-LD data. Here's the code that worked before, and the output as of 0.58.3:

    "@context": "https://schema.org/",
    "url": "{{ .Site.Params.Logo | absURL }}"
    ==> "@context": "https://schema.org/",
    ==> "url": "https:\/\/rubenerd.com\/logo.png"

The first URL was fine, but the second was having its forward-slashes escaped for some reason. No combination of `{{ safeURL }}`, `{{ printf }}`, or even horrid brute-force `{{ replace }}` statements could rid me of them. I suspected it had something to do with the first URL being hardcoded, and the second being the output from a function... but why should that matter?

When I put the function in a separate part of the file, it didn't inject the escapes. So I removed the quotes for *gits and shiggles*, and it works:

    "url": {{ .Site.Params.Logo | absURL }}
    ==> "url": "https://rubenerd.com/logo.png"

So hardcoded URLs within quotes aren't escaped, but any function that returns a URL within quotes is. When before they didn't. Perhaps Hugo is detecting it's in a JS code block, and helpfully adding quotes. But it breaks any behavior that relied on it not doing this before.

Hugo has been changing behavior like this *a lot*. Their release notes are usually pretty good at detailing changes, and they do point out it's not at a point one release yet. But it's lack of stability and backwards compatibility is beginning to wear thin.

I have been preparing a more permanent change that will address the core issue here though, but that's for another Perlier or Rustier post.

