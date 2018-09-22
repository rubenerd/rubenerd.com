---
title: "Upgrading pip packages"
date: "2018-03-22T16:08:12+11:00"
abstract: "It’s install --upgrade, not upgrade"
year: "2018"
location: Sydney
category: Software
tag:
- python
- package-managers
---
Let's upgrade something, like Jinja2:

    $ pip upgrade Jinja2

Wait, damn it. Do this:

    $ pip install --upgrade Jinja2

One of these days we'll have a unified, standardised syntax for package managers.

