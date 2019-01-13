---
layout: omake
title: "Engine room"
---
This page lists the tech that makes this blog possible.


### What runs the site

**[Hugo](http://gohugo.io)**

: This is the Porsche of static site generators; it's difficult to handle at times with Go's inscrutable templating, but its the only one around that can handle 6,000+ blog posts without taking the heat death of several universes to complete.<p></p>

**[FreeBSD](https://www.freebsd.org/)**

: It's still my preferred server operating system since trying it in high school. I use cloud instances with jails to keep things secure and easy to update.<p></p>

**[nginx](https://nginx.org/)**

: The fast, simple to configure web server and reverse proxy. Thanks to the maintainers of the [nginx-devel](https://www.freshports.org/www/nginx-devel) FreeBSD port.<p></p>

**[Let's Encrypt](https://letsencrypt.org/)**

: I bought HTTPS certs in the past, but this makes the process so simple. It can also now handle subdomains with little fuss.<p></p>

**[Ansible](https://www.ansible.com/)**

: All the site configuration, package installs and updates are carried out with Ansible playbooks.<p></p>

**[Bourne shell scripts](https://en.wikipedia.org/wiki/Bourne_shell)**

: These are the glue for everything else, for podcast pages, encoding audio, scaling Retina&trade; images, uploading generated assets, and other tasks. No bashisms.<p></p>


<hr />
### What used to run the site

**[Jekyll](http://jekyllrb.org) (2013–15)**

: I still think Liquid is the nicest templating system I've used, but alas Jekyll simply couldn't handle all my posts. For smaller projects, I couldn't recommend it highly enough.

**[WordPress](http://wordpress.org/) (2006–13)**

: The Mac Daddy of blogging software. Movable Type had gone commercial at that stage, and
Radio UserLand looked to be in its last throes, so I followed the pack to WordPress. For all
the security issues and poorly written plugins, it served me surprisingly well for many
years.

**[RapidWeaver](http://realmacsoftware.com/rapidweaver/) (2005)**

: An intriguing and pleasant Mac application that generated static pages, but I soon ran into limitations with updating sites from different places.

**[Perl CGI scripts](http://perl.org/) (2004-05)**

: I wrote my first site engine when at my first job out of high school, before university
started. It used CGI, which was a terrible idea but not enough people went to it to spawn
too many threads, so I avoided disaster!


<hr />
### How I write posts

**[Vim](https://vim.org) and [MacVim](https://macvim-dev.github.io/macvim/)**

: I've tried everything, and keep coming back to this legendary editor. I'm still learning new things with it even after a decade. [NERDTree](https://github.com/scrooloose/nerdtree) is still my favourite plugin.<p></p>

**Topre Keyboard**

: When I'm at home, everything is typed on this beautiful ten-keyless board I bought in Akihabara. Topres are the best mechanical keyswitches around.

**[Git](https://git-scm.org/)**

: Each blog post and site asset is version controlled with Git, which makes updates easier. I used and prefer Mercirual/hg, but I ~~forced~~ trained myself to use it.<p></p>

**[Michael Franks](http://www.michaelfranks.com/)**

: I'm often writing while listening to my favourite singer/songwriter of all time. His over half a century career include albums for every mood and time of day. Incidently, I wrote all but two of his albums on Wikipedia.<p></p>

**[Coffee shops](/omake/coffee/)**

: If there's an environment more conducive to positive thought and writing, I don't want to know.

