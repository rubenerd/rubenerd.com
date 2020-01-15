---
draft: true
title: "Learning emacs, with a boring editor history"
date: "2019-12-30T17:52:22+11:00"
abstract: ""
thumb: ""
year: "2019"
category: Thoughts
tag:
- 
location: Sydney
---
During this holiday break I've been sitting here, like a gentleman, doing something my fellow Vim users would consider RSI-enducing torture: I'm configuring a fresh [emacs](https://www.gnu.org/software/emacs/) install. And worse than that, it's been *fun*. I intend to blog about what I learn as I go, with the hope it'll be as useful to one of you out there as it will be for me.

But how and why did I consider making the sacraligeous jump from Vim to emcas? Not so fast, I still have feet placed firmly in both camps. But perhaps a rambling history will provide some context.

My first Unix editor experience was with the pico component of the excellent pine email client. I hacked and customised its spiritual successor nano [well into 2007](https://rubenerd.com/enabling-utf8-in-nano). The techbros laughed as they were want to do with newbies, but I genuinly got a lot of work and university assignments done with nano running in multiple shells, and some basic Perl scripts on the side to automate what nano couldn't do for me.

But I did start running into limitations. It's syntax highlighting struggled, especially in mixed files like [erubis](http://www.kuwata-lab.com/erubis/)... remember that? It also wasn't ubiqutous; UniSA's Solaris workstations didn't have it, nor did the machines I used at work. And I figured there must be a nicer way to edit multiple files than having shells with their own nano sessions.

I still hold much affection and respect for nano and pico, but I needed something more. Vim was a natural fit; itf fulfilled all my above requirements, and as a bonus you earned geek cred. People say the industry is a meritocracy; it's as much infatuated with image as any other.

I made the switch to Vim upon learning it had the same line cut and uncut features I was used to on nano, along with a ton more features and the ability to inject packages. I figured \*nix will always have vi, so it made sense to learn how it worked. I even put the effort into learning nvi when I started getting more serious about BSD.

But on the desktop I loved Smultron and TextMate on Mac OS X, as I [also blogged about in 2007](https://rubenerd.com/using-smultron-and-textmate/ "Using Smultron and TextMate"). The bundles features let me use an entire language package with common shortcuts and helpful tools for Perl, Ruby, XML, etc. Eventually though my career pivoted away from software development, and I was spending more time in the shell and, heaven forbid, word processors. Context switching meant I was constantly typing the wrong shortcuts constantly, so eventually it made sense to standardise on one environment with Gvim/MacVim.


