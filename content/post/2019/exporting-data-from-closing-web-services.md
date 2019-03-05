---
title: "Exporting data from closing web services"
date: "2019-02-16T08:56:26+11:00"
abstract: "As Glenn says, the bad part is that there's no easy way to import this data into something else."
year: "2019"
category: Internet
tag:
- exporting
- flickr
- goodbye
- perl
- written-in-sydney
---
Glenn Fleishmann wrote a post for Macworld for [exporting Flickr data]. I opened [my account] in 2005, and while I never cancelled my autopay for Pro, I haven’t [used it for years]. So I’ll be looking to do this. 

In the process, Glenn hit a meta point:

> The bad part is that there’s no easy way to import this data into something else. 

This is all too common an issue. When sites allow exports, they dump into a format that isn’t usable by laypeople. It’s worse on sites that are shutting down, because we’re left with a dump of data and none of the previous functionality.

It’s not an easy problem to solve; it’s not feasible to recreate features in an exported bundle. But surely there’s something better than parting with a data dump and a *good luck*. Maybe a parser or importer to another service would be a start.

But back to Flickr, I realised last weekend I even forgot to include the site in my `Content-Security-Policy` headers on the web server. I haven't included inline images from it for years, but much of the early blog was bootstrapped from Flickr and [Ourmedia] assets; the latter of which no longer even exists.

The good news the Flickr data is exported with XML. I'm thinking I'll batch process the images with Perl and ImageMagick, and make a static archive here.

[exporting Flickr data]: https://www.macworld.com/article/3153944/photography/how-to-download-your-flickr-photo-library-and-transfer-it-to-google-photos-or-icloud-photo-library.html
[Ourmedia]: https://rubenerd.com/new-method-for-ourmedia-uploading/
[used it for years]: https://rubenerd.com/tag/flickr/ "Posts tagged with Flickr"
[my account]: https://flickr.com/photos/rubenerd/

