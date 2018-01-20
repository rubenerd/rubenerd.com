---
draft: true
title: "The wonderful FreeBSD cal"
date: "2016-09-09T15:37:00+10:00"
year: "2016"
category: Software
tag:
- bsd
- cal
- calendars
- dates
- freebsd
- linux
- netbsd
---
You have a calendar on your Mac, Linux and BSD box called cal, another fine utility by Wolfgang Helbig over at FreeBSD. If you don't, your distrubution is terrible and you should switch.

What I love using it for is looking at hysterial historical calendars using the `-d` option. As you can see above, I was born a long time ago, on a Thursday.

     $ cal -d 1986-03
    
     ==>      March 1986
     ==> Su Mo Tu We Th Fr Sa
     ==>                    1
     ==>  2  3  4  5  6  7  8
     ==>  9 10 11 12 13 14 15
     ==> 16 17 18 19 20 21 22
     ==> 23 24 25 26 27 28 29
     ==> 30 31

My main gripe is it doesn't support stardates.
