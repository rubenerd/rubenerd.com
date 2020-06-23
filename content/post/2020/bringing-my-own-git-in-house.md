---
title: "Bringing my own git in-house"
date: "2020-06-22T08:43:34+10:00"
abstract: "Self-hosting all the things, especially given how problematic GitHub still is."
year: "2020"
category: Software
tag:
- git
- subversion
- version-control
location: Sydney
---
GitHub generated a lot of positive press for their renaming of *Master* branches to *Main*. I think they missed an opportunity to call it *Trunk*, but either way it's an [entirely hollow gesture](https://www.theverge.com/2019/10/9/20906213/github-ice-microsoft-software-email-contract-immigration-nonprofit-donation) for those of us who care about human dignity and rights.

Regardless of where you stand there though, this has reminded me that I need to bring more stuff in-house. Hosting your own git on a cloud instance or VPS is fairly simple with tools like Gitea, though I'm thinking of just using straight-up git with [GitWeb](https://git-scm.com/docs/git-instaweb) for publishing a web frontend for others to view. I don't need pull requests and other workflow tools for my personal projects, and GitWeb would give people visibility.

It's also got me thinking about where Subversion fits. I still prefer it for some [reasons](https://www.freebsdfoundation.org/wp-content/uploads/2018/10/FreeBSD-and-Git.pdf) among [others](https://www.apache.org/licenses/LICENSE-2.0), but with FreeBSD potentially moving to git (IIRC), and almost all of my work being git now, dare I say it makes sense to standardise on it and make my life easier. The site you're reading now has been on git since I moved off WordPress <del>five</del> seven years ago, as too are my dotfile configs and lunchbox.

Now that I think about it, all my public-facing repos and work are on git, either from the start or having been migrated from hg. It's my private stuff that's on Subversion. Maybe that could be a useful separation to maintain.

