---
title: "Reducing Perl memory usage"
date: "2020-03-12T16:45:51+11:00"
abstract: "It also cuts down on support requests."
thumb: "https://rubenerd.com/files/uploads/icon.perlcamelbook.png"
year: "2020"
category: Software
tag:
- perl
- programming
location: Sydney
---
[The imitable Brian D Foy](https://stackoverflow.com/a/9734699):

> Don't let people use your program. Whenever I've done that, I've reduced the memory footprint by about 100%. It also cuts down on support requests.

This made my day.

Jokes aside, has two words. The biggest difference for me was point three in his list. Read `<files>` line by line if they're massive, rather than loading them into memory at once. This definitely helps with multiple gigabytes of logs.

