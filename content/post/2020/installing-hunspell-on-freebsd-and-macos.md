---
title: "Installing Hunspell on FreeBSD and macOS"
date: "2020-01-02T10:40:45+11:00"
abstract: "Installing and putting word lists in the right place, and adding the correct environment variables"
year: "2020"
category: Software
tag:
- apple
- bsd
- editors
- emacs
- freebsd
- macos
- spelling
location: Sydney
---
[Hunspell](https://hunspell.github.io) is an excellent spell checking library written by László Németh I only learned of since trying emacs. Yes, that's happening! It's also the spell checker used for LibreOffice, OpenOffice.org, and Mozilla applications. It requires installation of the library, and one or more word lists to compare words against.

On macOS you can use Homebrew or pkgin to get the latest version, but the dictionary files may be missing or outdated:

    $ brew install hunspell
    # pkgin install hunspell

The alternative is to download and install [wordlists manually](https://sourceforge.net/projects/wordlist/files/speller/2019.10.06/). macOS used to place its dictionaries in `/Library/Spelling`, and hunspell is still set to look for them there. Assuming you've downloaded a language and need to unzip:

    # mkdir /Library/Spelling
    # unzip hunspell-en_GB-ise-2019.10.06.zip -D /Library/Spelling

FreeBSD installation is straightforward using ports or packages. The `en-hunspell` package includes all major English language flavours, some of which even spell flavours correctly:

    # pkg install hunspell en-hunspell

You may also require setting environment variables so tools like emacs can find the dictionaries and the correct language. For example, place these in your Bourne-compatible shell config if you're on macOS:

    export DICTIONARY=en_GB-ise
    export DICPATH=/usr/local/share/hunspell (FreeBSD)
    export DICPATH=/Library/Spelling (macOS)

You can now confirm which wordlists are detected and installed:

    # hunspell -D
    ...
    AVAILABLE DICTIONARIES (path is not mandatory for -d option):
    /Library/Spelling/en_AU
    /Library/Spelling/en_GB-ise

Using these in emacs will be in a future post.