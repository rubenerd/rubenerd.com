---
title: "Hugo generating content in memory"
date: "2016-07-19T11:17:00+10:00"
year: "2016"
category: Software
tag:
- gohugo
- weblog
- written-in-sydney
---
<p><img src="https://rubenerd.com/files/2016/hugoboss.jpg" srcset="https://rubenerd.com/files/2016/hugoboss.jpg 1x, https://rubenerd.com/files/2016/hugoboss@2x.jpg 2x" alt="" style="width:120px; height:224px; float:right; margin:0 0 10px 20px;" /></p>

This may be a little "inside baseball" as my American friends would say, but it was something I learned.

This site has been statically generated since 2013, originally with [Jekyll] and now with [Hugo]. Avoiding WordPress or a fully blown CMS means the site is easier to maintain and is **fast**. The only obvious downside is the time to generate the content each time.

<p style="font-style:italic">(As an aside, if Jekyll takes too long to render your 4000+ blog posts too, try Hugo. Go being orders of magnitude faster than Ruby shouldn’t have come as a shock, but wow is Hugo fast. It also has nothing whatsoever to do with the fragrence).</p>

I generate content on the server, but I was also wary of wearing out my SSD with thouands of small file writes each time I previewed a change. So I wrote a couple of terrible shell scripts that:

1. Created and formatted a new RAM disk
2. Symlinked Hugo's public folder to the disk
3. Generated a site preview with Hugo
4. Destroyed the disk after terminating Hugo

Since upgrading to Hugo 0.16 though, I noticed nothing was being written to the RAM disk. I thought it was a bug in my script; maybe the symlink wasn't being created.

*Turns out*, the answer was right in the  shell:

    $ hugo server --watch
    Started building site
    [..]
    Serving pages from memory.

Huzzah! And [from their docs]:

> ‘hugo server’ will avoid writing the rendered and served content to disk, preferring to store it in memory.

This makes me happy. It's also another reason to try Hugo if you haven't yet.

[Jekyll]: https://jekyllrb.com/
[Hugo]: https://gohugo.io/
[from their docs]: https://gohugo.io/commands/hugo_server/

