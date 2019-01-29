---
title: "The Ghost blog editor"
date: "2019-01-04T16:15:04+11:00"
abstract: "It’s too slow for me to use, unfortunately."
year: "2019"
category: Software
tag:
- blogging
- ghost
location: sydney
---
I've been trialling Ghost, and been impressed by its clean design. I've got it working nicely in a set of FreeBSD jails, with nginx proxying the requests and fixing up some of the headers, and Varnish for caching.

All was working great until I started using its editor. The delayed response time between typing a key and having it register was slight but instantly perceptible. I typed the same sentence in Vim, and a rich text fields in Tumblr and MediaWiki, and text appeared instantly.

It was so bad, I felt like I needed to pipe this visual editor through mosh.

I fully concede I'm in the minority if my eyes can perceive OLED screens refereshing, and can be irritated by JS-induced visual lag in Ghost, Visual Studio Code, Atom, and other memory abominations. It's odd having accessibility concerns for a sense that's apparently *better*.

I'm also open to the possibility there's something about my client setup. Maybe there's a Firefox plugin playing up. I have everything scripted with Ansible now in case I want to reproduce the environment and give it another try.

So I'm going back to the drawing board, and optimising my Hugo pipeline instead. Vim is such a better editor anyway, all it needs is some macros or scripts for automating some basic blog operations. That might be a fun project itself.

