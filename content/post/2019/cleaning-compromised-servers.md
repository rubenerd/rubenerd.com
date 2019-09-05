---
title: "Cleaning compromised servers"
date: "2019-08-28T09:29:48+10:00"
abstract: "Short answer: blow them away."
year: "2019"
category: Software
tag:
- cloud-computing
- security
- virtualisation
location: Sydney
---
I work at a cloud infrastructure company with immediate level 3 phone and email support; we'll even make Slack channels or whatever else. I know, it's shocking such a thing exists!

This is one of the most common questions my colleagues get asked, *how do I clean compromised servers?* I'm tempted just to get them to refer to [this cPanel article](https://documentation.cpanel.net/display/CKB/Why+can%27t+I+clean+a+hacked+machine)\:

> When a root account is compromised, users often ask how they can “clean” their server. To put it as succinctly as possible: without knowing every action that has ever taken place on a server, it is impossible to prove that the server is completely clean. While it is simple to show a compromised server, showing the opposite, for all intents and purposes, is not.

Even my honeypots get blown away and rebuilt rather than cleaned. Worries aside, rebuilds are just easier to do, especially if you use something like Ansible and have proper backups.

