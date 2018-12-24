---
title: "Paring back to an essential vimrc"
date: "2017-10-16T08:40:32+11:00"
abstract: "Turns out much of my config wasn’t needed in 2017."
year: "2017"
category: Software
tag:
- nvi
- vi
- vim
- text-editors
- written-in-sydney
---
I'd let a lot of cruft accumulate in my vimrc, as I'm sure we all have with software we've used for a long time. I'd had [replacement configs like this] in the back of mind, as well as plugins in light of the latest Vim 8.0 release, but never got around to implementing either.

But then I formatted my Mac laptop, fired up [MacVim] without my vimrc, and realised how productive I was with the standard config! So while stuck on a plane without WiFi – which was glorious – I decided to go the opposite direction and make as minimal a vimrc as possible. 

It's been a few weeks, and I'm still using it:

    set linebreak                "" soft linebreaks on words
    set number                   "" line numbers
    set ruler                    "" statusbar with mode, cursor position
    syntax on                    "" syntax highlighting
    set guifont=Inconsolata:h16  "" default font for (mac/g)vim
    set expandtab                "" convert evil tabs to nice spaces
    set shiftwidth=4             "" indent by 4 spaces
    set tabstop=4                "" tighter spacing for tabs

Almost half the settings are just for tab spacing. I've tried over the years to adapt to how Vim does things out of the box, but I use spaces instead of tabs, like a gentleman.

As for the settings I didn't add back in, a few were easy wins:

* `set nocompatible` is redundant; the existence of .vimrc will ensure Vim doesn't enter vi compatibility mode.

* `autocmd BufEnter *.md :setlocal filetype=markdown` is now redundant, because Vim 8's syntax highlighting detects md files as markdown.

* All my abbreviations/snippets live in [Alfred] now, so I didn't need all my `abbr` lines

As another bonus, this config is also nvi compatible for my embedded, FreeBSD and NetBSD machines, so it's just a matter of renaming or symlinking it to .nexrc.

[replacement configs like this]: https://github.com/amix/vimrc "The ultimate Vim configuration"
[MacVim]: https://github.com/macvim-dev/macvim
[Alfred]: https://www.alfredapp.com/help/features/snippets/ "Alfred: Snippets and Text Expansion"

