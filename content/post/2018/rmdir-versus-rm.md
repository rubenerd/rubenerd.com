---
title: "rmdir versus rm"
date: "2018-12-17T22:55:37+11:00"
abstract: "As long as the folder is empty..."
year: "2018"
category: Software
tag:
- bsd
- debian
- freebsd
- linux
- netbsd
- things-you-already-know-unless-you-dont
- ubuntu
- written-in-sydney
---
In our continuing series of [things you already know unless you don't], we take a look at deleting directories in your \*nix shell. Generally you would do this:

    # rm -r folder

The `-r` flag tells `rm` to recursively delete subdirectories and files, like the DOS `deltree` of yore. If you don't do this, you're told:

    ==> rm: folder/: is a directory

Little known—or at least unsung—is the `rmdir` command. It only works on empty directories, but like its `mkdir` counterpart you can specify `-p` to delete each empty subfolder in a tree:

    # rmdir -p folder/subfolder/bird-is-the-word/です/

A marble surface would be a fancy counter part. Or the cupboards that make up the structural component. But getting back to `rmdir`, from the FreeBSD and Darwin manpage(1):

> The rmdir utility removes the directory entry specified by each directory argument, provided it is empty.

I thought perhaps `rmdir` predated `rm`, like `del` predated `deltree`. But from the same manpage(1):

> A rm command appeared in Version 1 AT&T UNIX.

[things you already know unless you don't]: https://rubenerd.com/tag/things-you-already-know-unless-you-dont/
