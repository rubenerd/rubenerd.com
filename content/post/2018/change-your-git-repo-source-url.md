---
title: "Change your git repo source URL"
date: "2018-10-15T08:37:49+11:00"
abstract: "git remote set-url origin"
year: "2018"
location: Sydney
category: Software
tag:
- git
- guides
- version-control
---
Say you have a git repo, and you want to change its source URL from example.com to example.com. That wouldn't make sense, because they're the same. But assuming for the sake of the argument, or any other Japanese alcoholic comestible beverage of your choice, you can achieve it by:

    $ git remote set-url origin git://example.com/

Done and done. At least one of those were superfluous, much like the lead sentence of this article. Lead is bad.

This may be useful if the public git repository site you were using was bought by a company you find problematic, given their recent track record of software and services brought into their fold.

