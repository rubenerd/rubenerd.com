---
title: "Fun with a phpMyAdmin honeypot"
date: "2019-08-19T17:23:09+10:00"
abstract: "Create a web server with a dummpy phpMyAdmin folder, and watch the fireworks!"
year: "2019"
category: Internet
tag:
- honeypots
- nginx
- security
location: Sydney
---
Honeypots are fun. In IT parlance they're a deliberate attempt to make a server look vulnerable, in the hopes of attracking a nefarious user or drive-by scanner. You can use these passively to witness what exploits and common passwords are in the wild, or actively by dynamically training your firewalls and reporting IPs performing abuse. It also means I'm occupying and wasting someone's time, rather than giving them something useful.

My favourite is creating a simple webserver with `/phpMyAdmin/` in the root, then watch the server logs fill with all kinds of random fun.

Here was a log entry from this morning, showing an attempt to log in through a `GET` request on the dummy web form with `root` and `123456` as their credentials.  Scripts only try this because they must work sometimes, which is a bit scary to contemplate.

    $IP_ADDRESS - - [19/Aug/2019:06:54:06 +0000] \
    "GET /phpMyAdmin/index.php?lang=en&pma_username=root&pma_password=123456 \
    HTTP/1.1" 200 6529 "-" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) \
    AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.119 Safari/537.36"

All the attempts from this morning's haul are [in my lunchbox repo](https://github.com/rubenerd/rubens-lunchbox/blob/master/honeypot-20190818.log) for those interested. These are what were attempted, in order:

1. Usual suspects like root
2. Software names like mysql
3. Appending the above with numbers and exlamation points
4. Sequential, then random 6-digit number sequences
5. First row letter sequences like qwerty
6. Alphabetical order sequences, like abcdef
7. Mix of dictionary words, proper nouns, and keysmashes

They attempted 1,052 passwords before giving up; comparitively few compared to others which can run into the tens of thousands. Also, I have my new alias: *Qidian Wlozz!*

