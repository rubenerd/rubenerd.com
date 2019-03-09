---
title: "Dropbox isn’t case-sensitive"
date: "2019-03-07T09:15:33+11:00"
abstract: "You all likely knew this already, but it’s news to me."
year: "2019"
category: Software
tag:
- case-sensitivity
- dropbox
- security  
location: Sydney
---
I'm slowly weaning myself off Dropbox dependencies in favour of self-hosting and going back to basics, but in the interim I learned something. As far as I can tell, Dropbox isn't case-sensitive. You probably all knew that already, but it's news to me.

I store work-in-progress copies of blog assets in a Dropbox folder. Everything else sits in [encrypted sparsebundles], but this stuff is going to be public anyway, so I don't bother. Here it is on my home desktop:

    $ ls -1
    ==> Anime
    ==> Hardware
    ==> Internet
    ==> Media
    ==> Show
    ==> Software
    ==> Thoughts

They may seem familiar to those used to my hopelessly inadequate category system! On my other laptop, I have this:

    $ ls -1
    ==> anime
    ==> hardware
    ==> internet
    ==> media
    ==> show
    ==> software
    ==> thoughts

I've resynced them a few times, but they still come up as entirely lowercase. I'm not concerned as much as I am intrigued by how this came about.

[encrypted sparsebundles]: https://rubenerd.com/practical-private-dropbox-use-cases/
