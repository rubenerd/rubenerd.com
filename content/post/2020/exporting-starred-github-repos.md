---
title: "Exporting starred Github repos"
date: "2020-06-29T09:01:29+10:00"
abstract: "Another step closer to moving off the ethically-problematic platform."
year: "2020"
category: Software
tag:
- git
- github
- python
location: Sydney
---
I'm getting closer to exporting all my data from Github to a self-hosted system. My gists are now all in my <a href="https://github.com/rubenerd/rubens-lunchbox">lunchbox</a> which will be easy to move in one swoop. Then I remembered all the repos I'd starred over the years.

Jeff Carpenter's <a href="https://github.com/JeffCarpenter/export-stars">export-stars</a> Python script does a great job of exporting your stars to CSV, which is easily parsed by everything. It's now also my last starred repository which I kinda like.

Install the PyGithub dependency, then all you need to do is supply your username:

<pre>
$ pip3 install PyGithub
$ GH_USER=$YourUsername python3 export_stars.py > stars.csv
</pre>

I'm not sure what's the best way to present this list, but for now it's gone into the lunchbox too.

