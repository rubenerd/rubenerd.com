---
title: "A Sysinternals retrospective"
date: "2018-10-27T19:02:07+11:00"
abstract: "The tools Mark used to discover the Sony DRM rootkit."
year: "2018"
category: Software
tag:
- books
- tools
- windows
location: sydney
---
I've got a blog post about Windows 7 tools coming up, but in the interim I learned something about [Sysinternals].

I first learned of Mark Russinovich from his sci-fi thriller *[Zero Day]*, but I'd been using his tools on Windows for years. Windows hasn't been one of my daily drivers since XP, but Sysinternals is still among the first things I install on my odd job VMs and my game machine. I'm advocating at work for our Windows Server cloud templates to be bundled with them by default.

Sysinternals were like souped-up Microsoft PowerToys, with utilities for all kinds of neat things. One that I use a lot is Desktops; it exposes the virtual desktop features that have existed since NT 4.0, but Microsoft never created a front-facing UI for. Process Explorer is what Task Manager should have been.

I didn't know the latter and RootkitRevealer were the tools Mark discovered the now infamous Sony DRM rootkit with in 2005. Robert McMillan wrote an article for IDG at the time, [published in PCWorld]\:

> It turns out that Sony is using techniques normally seen only in spyware and computer viruses in order to restrict the unauthorized copying of some of its music CDs. Sony's software, licensed by Sony from a Banbury, UK, company called First 4 Internet, has become the basis of a dispute that once again pits computer advocates against an entertainment company experimenting with new ways to prevent the unauthorized copying of its products.

Mark released details of the root kit on his Sysinternals blog:

> Last week when I was testing the latest version of RootkitRevealer (RKR) I ran a scan on one of my systems and was shocked to see evidence of a rootkit. Rootkits are cloaking technologies that hide files, Registry keys, and other system objects from diagnostic and security software, and they are usually employed by malware attempting to keep their implementation hidden (see my “Unearthing Rootkits” article from thre June issue of Windows IT Pro Magazine for more information on rootkits). The RKR results window reported a hidden directory, several hidden device drivers, and a hidden application.

Sysinternals was long since bought my Microsoft, and Mark's blog redirected to them. Alas, Microsoft has been desperately trying to remove every useful knowledge base article and blog post it can get its hands on, but fortunately the Internet Archive [came to the rescue].

[Zero Day]: https://www.goodreads.com/book/show/9763010-zero-day
[came to the rescue]: https://web.archive.org/web/20060125015956/http://www.sysinternals.com/blog/2005/10/sony-rootkits-and-digital-rights.html
[Sysinternals]: https://docs.microsoft.com/en-us/sysinternals/downloads/sysinternals-suite
[published in PCWorld]: https://www.pcworld.com/article/123362/article.html

