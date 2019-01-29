---
title: "The Internet Archive Python CLI tool"
date: "2018-06-22T11:44:26-07:00"
abstract: "If you’re used to the FTP upload method, try this instead."
year: "2018"
category: Software
tag:
- california2018
- guides
- internet-archive
location: san-francisco
---
If you're used to the older FTP method of uploading material to the Internet Archive, you owe it to yourself and your password to try out their excellent Python command line tools.

To install the package on FreeBSD:

    # pkg install python3 py36-internetarchive

Or using pip on FreeBSD to install:

    # pkg install python3 py36-pip
    % pip install --user internetarchive

Or on macOS with Homebrew:

    $ brew install python
    $ pip install internetarchive

Let's confirm it worked:

    $ ia --help | head 1
    ==> A command line interface to Archive.org.

*Noice!* Now we can configure:

    $ ia configure

    ==> Enter your Archive.org credentials below to configure 'ia'.
    ==> Email address: [..]
    ==> Password: [..]
    ==> Config saved to: /home/rubenerd/.config/ia.ini

Now you can upload, download, delete, search, view tasks, copy/move, and more. The syntax is simple:

    $ ia <action> [options] <identifier>

More info is available with `ia --help`. If you fudge an argument or file path, it prints out inline instructions to help you out.

