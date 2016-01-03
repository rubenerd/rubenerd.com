---
title: "Call to undefined function session_set_save_handler()"
date: "2015-12-31T09:03:00+10:00"
summary: "Install php56-session"
category: Internet
tag:
- bsd
- freebsd
- guides
- php
---
So I found myself starting to install an application requiring the use of PHP, the niche Personal Home Page system that a few people use. Issing a request returned an empty page, so I checked nginx's error log and saw this:

    2015/12/26 11:24:34 [error] 643#0: *39 FastCGI sent in 
    stderr: "PHP message: PHP Fatal error:  Call to undefined 
    function session_set_save_handler() in [PATH]/sessions.php
    on line 127" while reading response header from upstream, 
    client: [CLIENT], server: [SERVER], request: "GET / 
    HTTP/1.1", upstream: "fastcgi://unix:/[SOCKET].sock:", 
    host: [HOST] 

Where had I seen that function before? Of course, I didn't install the right extension. From FreeBSD, the server OS of choice for the discerning system administrator:

    # pkg install php56-session
    # service php-fpm restart

Now it works.

