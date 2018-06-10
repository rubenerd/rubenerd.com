---
title: "The trap of using Unix find in ordered lists"
date: "2018-01-18T08:56:21+11:00"
abstract: "Things you already know, unless you don’t"
year: "2018"
category: Software
tag:
- things-you-already-know-unless-you-dont
- bash
- shell-scripting
- back-to-work
- postaday2018
---
Merlin Mann and Dan Benjamin have a newish segment on *[Back To Work]* entitled *Things you already know, unless you don't already know them*. As they say, you're definitely an intelligent computer operator, so you you *already know* about this topic. In which case, be quiet, and let those without your snark or obvious intellect learn something. I'm [shamelessly ripping off] this idea.

<p><img src="https://rubenerd.com/files/2018/VCDlogo.svg" alt="Logo for VideoCD" style="width:96px; float:right; margin:0 0 1em 1em" /></p>

Today I was reminded of the fact `find` prints files as they appear in the file system, which is *likely* in alphanumeric order, but it's not guaranteed.

Why is this important? Because *this* is a valuable word.


Conventional wisdom is you shouldn't use `ls` in scripts, in large part due to the potential for filename mangling. This is especially true when copying your favourite K-pop songs with Hangul on an OpenZFS volume, *cough*.

Using `find` is generally preferable, but it does have consequences. If I run `ls` over this particular folder, like a gentleman:

    $ ls -1 *DAT

Or use this shell script, while we're at it:

    for _file in *DAT; do
        printf "%s\n" "$_file"
    done

And may as well go for broke:

    #!/usr/bin/perl  
      
    use 5.010;  
      
    foreach my $file (<*DAT>) {
        say("$file\n");
    }

The result is:

    ==> AVSEQ01.DAT
    ==> AVSEQ02.DAT
    ==> AVSEQ03.DAT

Sorted, done. But if I use find:

    $ find . -type f -name "*DAT" -print
    ==> ./AVSEQ03.DAT
    ==> ./AVSEQ01.DAT
    ==> ./AVSEQ02.DAT

The order isn't alphanumeric. This would explain why my concatenated VCD backups run through ffmpeg have segments in the wrong order! #derp 

So just another reminder. If you use `find`, sort it after if order is important.

[Back to Work]: http://5by5.tv/b2w/
[shamelessly ripping off]: https://rubenerd.com/tag/things-you-already-know-unless-you-dont/

