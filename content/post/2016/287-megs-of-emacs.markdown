---
title: "287 megabytes of Emacs"
date: "2016-09-30T09:49:00+10:00"
year: "2016"
location: Sydney
category: Software
tag:
- emacs
- vim
---
This 11" MacBook Air is still an incredible machine for its size, though its aging 60GB SSD is getting a bit long in the tooth. While I decide what to replace it with, I've been trying to scrounge enough space to live on. 

GrandPerspective highlighted something rather eye-opening with a default macOS install:

    $ ls -lh /usr/bin/emacs
    ==> -r-xr-xr-x  1 root  wheel   274M Sep 14 10:57 emacs*

I guess kitchen sinks wrapped in paretheses come with a steep cost. By comparison, here's my primary web browser:

    $ du -sh /Applications/Vivaldi.app/
    ==> 178M    /Applications/Vivaldi.app/

And iTunes, which everyone claims is bloated and slow:

    $ du -sh /Applications/iTunes.app/
    ==> 184M    /Applications/iTunes.app/

And my [weapon of choice]:

    $ ls -lh /usr/local/Cellar/vim/8.0.0005/bin/vim
    ==> -r-xr-xr-x  1 rubenerd  staff   2.1M Sep 25 10:44 vim*

Crazy stuff. I'd delete Emacs from my machine if it weren't for having a discrete, console-based tetris game.

### Footnotes

**[Inb4]** people tell me Emacs can do more, than Vim isn't as good as Emacs, that Vim needs extensions, that kitchen sinks are actually more portable than they look, that iTunes stores plugins and metadata elsewhere, and that if I think 287 megabytes is large it's a problem with my SSD, which I already addressed.

[Inb4]: http://knowyourmeme.com/memes/inb4--2 "In before..."
[weapon of choice]: https://youtube.com/watch?v=wCDIYvFmgW8

