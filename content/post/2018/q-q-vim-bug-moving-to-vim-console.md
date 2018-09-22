---
title: "$q q Vim bug, and moving to vim-console"
date: "2018-05-03T08:38:02+10:00"
abstract: "When a mild irritation finally warranted further investigation!"
year: "2018"
location: Sydney
category: Software
tag:
- bsd
- freebsd
- freshports
- pkgng
- gvim
- vim
---
I had this weird Vim bug on a couple of FreeBSD box I maintain. The last line would always be partially clobbered with these characters when opening a file, or would be added to a new buffer:

    $q q

I briefly thought it was writing and duping `:q` to the file, instead of interpreting it, but hitting `ZZ` like a [certain musical fan] did the same thing. Pro tip: They're pronounced [Zed-Zed Top]. It clearly wasn't the case though; it had no ill effects on config files, and `cat` didn't show them. So it looked like a rendering issue.

Not to get all 43 Folders on you, but *turns out* it was specific issue with using Terminal.app on macOS to access specific versions of Vim. [This bug on GitHub] suggests its Terminal.app's fault for advertising itself as xterm in `$TERM`; a common practice among terminal emulators, but not strictly true. If so, it's curious it didn't manifest before.

In any case, there's a mitigation in place in the most recent versions. So upgrade and be done!

The second curiosity came from trying to upgrade vim. [I used vim-lite] on headless servers, so I don't pull in Xorg or GTK dependencies. But when I went to upgrade it:

    # pkg upgrade vim-lite
    ==> pkg: No packages available to upgrade matching
    ==> 'vim-lite' have been found in the repositories

Weird! Checking all available vim ports:

    # pkg search vim
    ==> [..]
    ==> vim-8.0.1769
    ==> vim-console-8.0.1769
    ==> vim-tiny-8.0.1769
    ==> [..]

Checking [vim-console in Freshports], the tireless maintainer adamw@ committed this change on the 11th of January:

> Rename editors/vim-lite to editors/vim-console. The vim-console port isn't
actually any lighter---it's built with exactly the same feature-set as
the main vim port. The only difference is lack of gtk20 GUI, and the
language bindings are off by default.

Makes sense. So now we can upgrade:

    # pkg remove vim-lite
    # pkg install vim-console

And now I've banished `$q q`! I shouldn't be this happy about this.

[certain musical fan]: https://en.wikipedia.org/wiki/ZZ_Top "ZZ Top on Wikipedia"
[This bug on GitHub]: https://github.com/vim/vim/issues/2008
[Zed-Zed Top]: https://en.wikipedia.org/wiki/Rhoticity_in_English "Wikipedia article on English Rhoticity"
[vim-console in Freshports]: https://www.freshports.org/editors/vim-console/
[I used vim-lite]: https://gist.github.com/rubenerd/68920d7bed70b67763f9b8bc95695374 "My GitHub gist showing the last vim-lite version"

