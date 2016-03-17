---
title: "Browsing tar files with Vim"
summary: "You can!"
date: "2016-03-16T14:31:00+10:00"
category: Software
tag:
- bsd
- freebsd
- linux
- mac-os-x
- netbsd
- nvi
- vi
- vim
---
Here's a neat trick I learned today, entirely by accident. Say you were to open a tar file with Vim:

    $ vim firewall-team.tar

You can view its contents and even edit the files inline!

    " tar.vim version v26
    " Browsing tarfile [..]/firewall-team.tar
    " Select a file with cursor and press ENTER
    
    firewall-team/
    firewall-team/shinonono.houki
    firewall-team/mizuno.ami
    firewall-team/ayanami.rei
    firewall-team/stadtfeld.kallen
    firewall-team/littner.yoko

By comparison, [nvi on FreeBSD and NetBSD] will return fireworks. For certain times of the year this may be desirable, but may not be legal in certain juristictions. It's also likely not what you're after when browsing tar files. 

    firewall-team/^@^@^@^@^@^@^@^@^@^@^@^@^@^@
    [..]

Emacs can also be used to read tar files, if your [pinkie] isn't prone to repetitive stress injuries.

[nvi on FreeBSD and NetBSD]: https://rubenerd.com/trying-nvi/ "Rubénerd: Trying out the nvi editor"
[pinkie]: http://ergoemacs.org/emacs/emacs_pinky.html "How to Avoid the Emacs Pinky Problem"

