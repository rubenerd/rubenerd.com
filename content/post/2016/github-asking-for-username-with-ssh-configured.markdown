---
title: "GitHub asks for username with SSH configured"
abstract: "Re-clone from the SSH url!"
date: "2016-03-08T11:45:00+10:00"
year: "2016"
category: Software
tag:
- git
- github
- guides
---
If you use GitHub in any capacity, you should be using a [public key] with your account. It's one of those blissfully–rare occurrences where security and convenience intersect. GitHub recommends using HTTPS URLs, but I still reckon SSH is easier.

Despite configuring it, pushing commits to a newly-cloned repo resulted in a password prompt. This means the SSH key isn't being used.

    $ git push origin master
    Username for 'https://github.com': ^C

This was a new machine reload, and my orchestration scripts had configured Git in the past without any problems. Well, with as few as possible problems as one could expect from Git.

The hint was the "https" in the username field. I'd cloned the repo from [HTTPS] instead of [SSH]. Recloning with the SSH url allowed pushing these changes without further prompts.

Lesson learned, don't tackle Git before your morning coffee.

[public key]: https://help.github.com/articles/which-remote-url-should-i-use/#cloning-with-ssh-urls
[HTTPS]: https://help.github.com/articles/which-remote-url-should-i-use/#cloning-with-https-urls-recommended
[SSH]: https://help.github.com/articles/which-remote-url-should-i-use/#cloning-with-ssh-urls
