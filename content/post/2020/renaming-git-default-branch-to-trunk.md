---
title: "Renaming git default branch to trunk"
date: "2020-07-09T09:54:36+10:00"
abstract: "Scott Hanselman offers a reason why they chose main, but trunk works better for me."
year: "2020"
category: Internet
tag:
- git
location: Sydney
---
GitHub's change of [master to main](https://rubenerd.com/bringing-my-own-git-in-house/) was a decent, [if still somewhat hollow](https://www.theverge.com/2019/10/9/20906213/github-ice-microsoft-software-email-contract-immigration-nonprofit-donation) gesture. But I wondered why they couldn't have defaulted to trunk like svn, given it makes more semantic sense with branches.

Scott Hanselman offers [one potential reason](https://www.hanselman.com/blog/EasilyRenameYourGitDefaultBranchFromMasterToMain.aspx)\:

> NOTE: Changing the default branch to "main" also has the benefit of starting with "ma" so that autocomplete <TAB> muscle memory still works. Another great option for your main github branch is "latest." The goal is to just be unambiguous.

This is probably true if you're used to git. I'm more familiar with subversion, so being able to keep trunk works better for the same reason.

