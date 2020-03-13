---
title: "How to version control LibreOffice spreadsheets"
date: "2020-03-13T16:37:13+11:00"
abstract: ""
thumb: ""
year: "2020"
category: Thoughts
tag:
- 
location: Sydney
---
In late February I discussed finally [moving off YNAB entirely](https://rubenerd.com/a-final-farewell-and-thanks-to-ynab4/) and back to a LibreOffice spreadsheet that replicates a similar interface, register, and envelope system. It's made my budget cross-platform, faster, and easier to graph and manipulate.

One other advantage I realised having a budget in this form is the ability for it to be version controlled. That way, if I make substantive functional changes, or even accrue sufficient new transactions, it can be backed up, checked out across a few machines, and restored in the event I bork something.

*We are The Bork. Lower your sheilds and surrender your ships. We will add your biological and technologically-borked files to our own. Your spreadsheets will adapt to service us. Resistance is futile.*

There's just one downside: OpenDocument spreadsheets are [stored as zipped XML](https://en.wikipedia.org/wiki/OpenDocument_technical_specification#Format_internals), so to Git and Subversion they're binary files:

    $ uname -a | cowsay
    ==>  ________________________________________ 
    ==> / FreeBSD haruhi 12.1-RELEASE-p2 FreeBSD \
    ==> \ 12.1-RELEASE-p2 GENERIC amd64          /
    ==>  ---------------------------------------- 
    ==>    \   ^__^
    ==>     \  (oo)\_______
    ==>        (__)\       )\/\
    ==>            ||----w |
    ==>            ||     ||

That was clearly the wrong command. Trying again:

    $ git diff budget.ods
    ==> diff --git a/budget.ods b/budget.ods
    ==> index 06a7a30..8b50745 100644
    ==> Binary files a/budget.ods and b/budget.ods differ

Git famously handles binary files poorly; another reason I wish I'd stuck to Subversion for all my personal stuff. But LibreOffice can be told to store the file as flat XML, which can be easily diff'd:

1. Open LibreOffice, then your spreadsheet.
2. Go to File &rarr; Save As.
3. In the *File type* dropdown, choose Flat XML ODF Spreadsheet.

*(I would hope step one and two above would be obvious, but I still get comments from people on Twitter asking why they can't find a Mac shortcut on their Windows machine, or why `freebsd-update` doesn't work on Debian. I'm sure Colin Percival would be flattered to think he's update mechanism is so good people attempt to use it elsewhere).*

Your resulting file will be significantly bigger; in my case it went from 900 KiB to just under 16 MiB. But disk space is cheap, and now you have a file any version control system can [digest](http://svnbook.red-bean.com/en/1.7/svn-book.html#svn.serverconfig.httpd.authn.digest). That pun was *top shelf*.

