---
title: "Consolidating running software"
date: "2020-09-23T12:28:53+10:00"
abstract: "Everything was easy, until text editors."
year: "2020"
category: Software
tag:
- bsd
- emacs
- freebsd
- macos
- org-mode
- thunderbird
- vim
- workflow
location: Sydney
---
How do you deal with running software on your desktop? I had to be careful with the phrasing: I would have said *open* software, but then it would sound like I'm asking about open source software, or software that works with open standards. Terminology is hard.

I've always treated running software the same way I do with services and daemons on servers. Each open application has to have a *specific* purpose for what I want to do at that point in time, and if not, it gets closed. This habit was ingrained from 1990s experience where too many open programs pushed resources to swap, and before protected memory meant one crashed program could bring down dozens! It also potentially helps with security. But I'd be lying today if I didn't admit the real reason is cognitive overhead.

I don't like my FreeBSD Xfce panel or macOS dock showing more than, ideally, eight running applications. It's too much to track, and results in visual clutter which impacts my anxiety. Eight sounds like it should be plenty, but once you get a browser, PIM client, all the chat apps you're expected to run, a couple of text editors, a terminal, office software, and a PDF viewer with your LaTeX output, you run out fast.

I'm thinking now what I can do to minimise these further. The time for open chat standards and programs like Trillian and Pidgin are sadly long gone, so I'm trialling [Ferdi](https://getferdi.com/) to consolidate them. PIM for work unfortunately needs to all be in Outlook, but [Thunderbird](https://www.thunderbird.net/) still works for all the other stuff for personal projects. And do I really need three different browsers, especially for someone who doesn't do frontend web dev?

Which leaves editors, superficially the simplest software in the bunch, but they're anything but. That was some great alliteration.

I was a *huge* fan of the original [TextMate](https://macromates.com/) on Mac, and still consider it the gold standard of editors. But I forced myself to make the switch to [MacVim](https://macvim-dev.github.io/macvim/)/[gvim](https://www.vim.org/), in part so I could also use it on FreeBSD, but also becuase I knew vi anyway and felt like I could use it more broadly. Every blog post written since my move to static site generators has gone through it.

... And then an evil colleague introduced me to [emacs](https://www.gnu.org/software/emacs/) and [Org mode](https://orgmode.org/), and it happily reminded me enough of TextMate&mdash;and a touch of Lotus Agenda&mdash;that I use it concurrently with Vim. Software hasn't gelled with me this quickly since [nvALT](https://brettterpstra.com/projects/nvalt/) which, perchance, I also still run as my text-based wiki.

At some point I should bite the bullet and move over to one editor for everything, and based on my use case it seems emacs fits the bill. I learn things the best jumping in the deep end; and might find it useful as a general text editor too. But then, I'm so fast with Vim, and nvALT's search is still the most elegant I've used. Then I think life is too full of damned compromises already, and I end up sticking with three.

So there we are, I've narrowed down my open application list, and only half are editors! At least I've cut down a bunch of Electron.

