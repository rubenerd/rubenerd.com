---
title: "Curly bracket substitution in sed, nvi, Vim"
date: "2019-04-16T09:05:34+10:00"
abstract: "Don’t escape them if you’re just matching them, and you’ll be fine."
year: "2019"
category: Software
tag:
- bsd
- freebsd
- regex
- nvi
- vim
location: Sydney
---
What is it they say about regular expressions? I got caught out making a basic mistake substituting curling brackets at the start of lines in a text file, so I thought I'd share it.

Here was my first attempt in FreeBSD nvi, escaping the bracket:

    :%s/^\{//
    ==> RE error: repetition-operator operand invalid.

Hmm, weird. The same happened with nvi installed from MacPorts on my work laptop. So I tried Vim:

    :%s/^\{//
    ==> E866: (NFA regexp) Misplaced {
    ==> E64: \{ follows nothing
    ==> E476: Invalid command
    ==> Press ENTER or type command to continue

This should be simple, what was I doing wrong? I tried `sed` to mimic what I was doing above:

    $ sed -i '' -e 's/^\{//' $_FILE
    ==> sed: 1: "s/^\{\"id\"\:\"//
    ==> ": RE error: invalid repetition count(s)

Can you see the problem?

Not to get all Malcolm Gladwell on you, but *turns out* I shouldn't have been escaping the curly bracket. So doing this was sufficient:

    %s/^{//

I'm going to dub this *premature escaping*. Or maybe *Ruben shouldn't do early morning regex without coffee and/or sufficient sleep*.

