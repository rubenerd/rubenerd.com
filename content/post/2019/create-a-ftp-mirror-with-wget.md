---
title: "Create a mirror of an FTP site with wget"
date: "2019-01-18T08:31:56+11:00"
abstract: "wget -m ftp://url/"
year: "2019"
category: Thoughts
tag:
- archiving
- feedback
- ftp 
location: sydney
---
People have asked how I downloaded FTP mirrors I mentioned on the [archived hat] episode, especially in light of [recent news].

There are so many tools you can use, but wget makes it simple:

    $ wget -m ftp://site.tld/folder/

And If you need authentication:

    $ wget -m ftp://host.tld/folder/ --user=username --password=password

There are tools that will let you do batch downloads, but wget works sequentially on one file at a time. I think that's a reasonable balance between getting the material and respecting the target site's bandwidth.

As I said on that show, I'm realising that if you treasure something online, you need to preserve it yourself. Or if you're allowed to, send it to the Internet Archive.

[archived hat]: https://rubenerd.com/show388/ "Rubenerd Show 388: The archived hat episode"
[recent news]: https://rubenerd.com/ibm-agrees-to-buy-red-hat/
