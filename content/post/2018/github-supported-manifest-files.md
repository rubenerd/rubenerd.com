---
title: "GitHub supported manifest files"
date: "2018-01-11T21:09:19+11:00"
abstract: "We have both kinds"
year: "2018"
location: Sydney
category: Internet
tag:
- documentation
- language
- programming
- github
---
GitHub has the concept of a dependency graph you can view in a public or private repo, to view relationships between dependencies and be alerted to security issues. According to one of my  public repos, emphasis added:

> To enable the dependency graph, your repository must define dependencies in [one of the supported manifest file types], **like** `package.json` or `Gemfile`. 

Interesting, I wonder what other manifest files are supported? Let's click the link and find out:

> To enable the dependency graph for your project, your repository must define Ruby or JavaScript dependencies in **either** a Gemfile or package.json file.

Huh, that was it?

The issue is **like** and **either** are not equivalent. The word **like** in this context suggests a partial subset; you wouldn't say *there are two condiment choices, like mustard and tomato sauce*.

We have [both kinds], country and western!

[one of the supported manifest file types]: https://help.github.com/articles/listing-the-packages-that-a-repository-depends-on
[both kinds]: http://bluesbrothersofficialsite.com/gi-174026-we-have-both-kinds-country-and-western.html

