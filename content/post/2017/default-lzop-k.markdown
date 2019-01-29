---
title: "Happy anniversary and tricks from lzop!"
date: "2017-09-23T10:19:25+10:00"
abstract: "Ten years of lightning-fast compression."
year: "2017"
category: Software
tag:
- compression
- lzop
location: sydney
---
[lzop] by the imitable [Markus F.X.J. Oberhumer] is an infeasibly-fast file compressor. This post is a thank you for its existence, an anniversary update, and my discovery of default operation that all such tools should be doing.

I haven't done a pointless introduction paragraph in ages. And the next section is equally pointless.

<p><img src="https://rubenerd.com/files/2013/anime.mikurubeam2013@1x.jpg" srcset="https://rubenerd.com/files/2013/anime.mikurubeam2013@1x.jpg 1x, https://rubenerd.com/files/2013/anime.mikurubeam2013.jpg 2x" alt="" style="width:500px; height:280px;" /></p>


### Mikuru Beam Dynapacks

Before we proceed, as has happened on every compression post for the [last decade], we have Asahina Mikuru doing her *Mikuru Beam*. As I [explained before]: 

> For some reason, every time I discuss file archiving and compression, I've included images of Asahina Mikuru from *The Melancholy of Haruhi Suzumiya* (© Kyoto Animation). Presumably because her *moebeam* can similarly compress files.

That original rzip post I also included a [Dynapac CC232 photo] by Lestat, presumably because they compress bitumen, which is a neat metaphor for a [tar] file. GET IT!? ***HA HAAAAAAAA!*** What?

<p><img src="https://rubenerd.com/files/2013/anime.mikuruworried2013@1x.jpg" srcset="https://rubenerd.com/files/2013/anime.mikuruworried2013@1x.jpg 1x, https://rubenerd.com/files/2013/anime.mikuruworried2013.jpg 2x" alt="" style="width:500px; height:280px;" /></p>

Anyway, we're in a Retina&trade; world now, so I've sourced the original image and uploaded a higher-resolution version for those of you using recent browsers that support [srcset].

That may qualify as the longest digression I've ever had on this blog. Not a small feat, because mine are more medium-sized.

<p><img src="https://rubenerd.com/files/2017/dynapac@1x.jpg" srcset="https://rubenerd.com/files/2017/dynapac@1x.jpg 1x, https://rubenerd.com/files/2017/dynapac@2x.jpg 2x" alt="" style="width:500px; height:280px;" /></p>


### lzop's anniversary

Moving on. lzop had its tenth anniversary last month, announced in typically understated fashion on the project's homepage:

> Happy 20th Anniversary Release! (Aug 2017)

Congrats to Markus for this huge achievement. We should pay omage to this by including in every *nix distribution. The fact it's on my list of essential packages in Ansible because of its lack of default availabilty is a travesty.


### A desirable default operation

And now, the thing I learned yesterday. As if we needed another reason to love lzop it, you don't need to specify `-k` to keep the original file after compressing:

    $ lzop -v file
    ==> compressing file into file.lzo
    
    $ ls -1
    ==> file
    ==> file.lzo

From the `lzop(1)` man page:

> -k, --keep
           Do not delete input files. This is the default.

This should the default for all tools like this. File deletions are destructive operations that should always be initiated by the user.


[lzop]: http://www.lzop.org
[last decade]: https://rubenerd.com/rzip-is-absolutely-incredible/
[explained before]: https://rubenerd.com/using-xz-with-newsyslog/
[Markus F.X.J. Oberhumer]: http://www.oberhumer.com/
[Dynapac CC232 photo]: https://commons.wikimedia.org/wiki/File:Dynapac_CC232.JPG
[srcset]: http://www.w3.org/TR/html-srcset/
[tar]: https://www.freebsd.org/cgi/man.cgi?query=tar&apropos=0&sektion=0&manpath=FreeBSD+11.1-RELEASE+and+Ports&arch=default&format=html

