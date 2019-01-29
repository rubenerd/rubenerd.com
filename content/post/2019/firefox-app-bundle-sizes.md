---
title: "Firefox application bundle sizes"
date: "2019-01-13T12:39:23+11:00"
abstract: "Less than half the size of Chrome!"
year: "2019"
category: Software
tag:
- browsers
- firefox
location: sydney
---
I did a [back of envelope calculation] in December 2016, and was surprised to find Firefox was smaller than Chrome that I kept around for testing. Not a bit smaller, *half* the size. 

These were the original results:

    $ du -sh /Applications/Firefox.app/
    ==> 189M    /Applications/Firefox.app/
    
    $ du -sh /Applications/Google\ Chrome.app/
    ==> 366M    /Applications/Google Chrome.app/

I ran it again today:

    $ du -sh /Applications/Firefox.app/
    ==> 179M	/Applications/Firefox.app/
    
    $ du -sh /Applications/Google\ Chrome.app/    
    ==> du: /Applications/Google\ Chrome.app/: No such file or directory

Oh yeah, I got rid of the latter entirely. Still, Firefox is even smaller now.

[back of envelope calculation]: https://rubenerd.com/firefox-and-vivaldi-are-smaller/

