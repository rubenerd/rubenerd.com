---
title: "Yearly archives in GoHugo"
date: "2018-01-09T09:43:23+11:00"
abstract: "You can now browse the blog by year again, which is kinda cool."
year: "2018"
category: Internet
tag:
- weblog
- hugo
location: sydney
---
You can now browse posts here by year again, which is kinda cool. The links are now in the sidebar and archive pages. For those reading this via [RSS], these are the browsable years:

> [2018](https://rubenerd.com/year/2018/), 
> [2017](https://rubenerd.com/year/2017/), 
> [2016](https://rubenerd.com/year/2016/), 
> [2015](https://rubenerd.com/year/2015/), 
> [2014](https://rubenerd.com/year/2014/), 
> [2013](https://rubenerd.com/year/2013/), 
> [2012](https://rubenerd.com/year/2012/), 
> [2011](https://rubenerd.com/year/2011/), 
> [2010](https://rubenerd.com/year/2010/), 
> [2009](https://rubenerd.com/year/2009/), 
> [2008](https://rubenerd.com/year/2008/), 
> [2007](https://rubenerd.com/year/2007/), 
> [2006](https://rubenerd.com/year/2006/), 
> [2005](https://rubenerd.com/year/2005/), 
> [2004](https://rubenerd.com/year/2004/)

I wish I did some tricked out Go to make this possible, but I just created a year taxonomy in [Hugo]. In my `config.yaml`, which I use instead of TOML, like a gentleman:

    taxonomies:
      category: "category"
      tag: "tag"
      year: "year"

And in the frontmatter for typical blog posts:

    title: "Yearly archives in GoHugo"
    date:  "2018-01-07T10:51:23+11:00"
    year:  "2018"

The illustrious [Edgar F. Codd and Raymond F. Boyce] would scoff at this, but works and is very fast.

Which reminds me, consider this another shameless plug for Hugo. I loved using Jekyll, but it took forever to parse and generate thousands of posts. Hugo is orders of magnitude faster; this is **not** an exaggeration! Also, if you haven't tried static site generation for your blog, please do.

[Edgar F. Codd and Raymond F. Boyce]: https://en.wikipedia.org/wiki/Boyce–Codd_normal_form
[Hugo]: https://gohugo.io/
[RSS]: https://rubenerd.com/feed/

