---
title: "Gatekeeping, and Mac users on FreeBSD"
date: "2020-05-03T08:48:44+11:00"
abstract: "Or when people act shocked that people use the right tools for the job."
thumb: "https://rubenerd.com/files/uploads/icon.freebsd-logo.png"
year: "2020"
category: Software
tag:
- apple
- bsd
- freebsd
- mac
location: Sydney
---
There was a Twitter thread about FreeBSD earlier this year where someone was shocked to realise a FreeBSD user had a Mac laptop, and other ran Windows at work. The Twitterer and new FreeBSD user suggested that FreeBSD people should only ever use FreeBSD. I'm paraphrasing, but the responses were that gatekeeping isn't helpful to the project.

I've had one foot in the Apple camp since the mid-1990s. Over the years I made the switch from Windows to Linux and the BSDs, but I've always had a Mac of some description as well. Despite Apple's best efforts of late, there's still no better desktop environment for most of my work and personal projects. Same for the iPhone.

What stopped me jumping all in with Apple:

* Overwhelmingly the number one reason: **Apple can't deliver a trustworthy file system**, even with Core Data and APFS. Metadata verification is simply insufficient for any data you care about, especially family photos. Ditto for backups, which will rot in ways you don't expect until it's too late. 

* They've abandoned the server space in any practical sense. Which is a shame; especially in the PowerPC days they were one of the few remaining suppliers that offered a supported UNIX on something other than x86. Damn I miss Sun something fierce.

* I like computers, and playing with a range of them. And there was always the nagging feeling in the back of my mind not to become dependent on a single vendor; thus even most of the software I run on Macs is cross-platform and, more importantly, saved to open file formats.

* Their GPUs suck. Which is bizarre, because their laptop displays still leave everyone else so far in the dust it's not even a contest. It blows my mind how awful most PC displays still are: 1.5x HiDPI if you're lucky, *are you kidding me?* I'll stop now!

* They've given up on ultraportable laptops after retiring the 11-inch MacBook Air and the 12-inch MacBook. The new MacBook Airs weigh more than a kilo once more, and they're made thin by stretching them out too wide for my small shoulder bags.

FreeBSD fills all these needs nicely:

* FreeBSD with netatalk4, ZFS, and GELI makes a reliable, robust, fast, and trustworthy file server stack. My experience has been that it consistently outperforms SMB and NFS to Macs, and marginally more with AFS on Debian, even though Apple lists AFS as deprecated; go figure. I squirm thinking about all the storage hosted on third-party NAS systems that have rudimentary integrity checks, if any at all. 

* A small home FreeBSD server is affordable, fast, and easy to administer for sysadmins. And if you're not one, there's FreeNAS. I say affordable not free, because you really should [donate to the Foundation](https://www.freebsdfoundation.org/donate/) if you find the OS useful.

* My FreeBSD workstation with a decent NVIDIA card can be dual-booted into Windows 10 to renew my disgust for that client OS, and for running the precious few games I care about.

* FreeBSD on my tiny Japanese Panasonic Let's Note makes for a fantastic ultraportable with a great HiDPI screen, better keyboard that Apple ships, and all-day battery. On the go I mostly only need an SSH prompt, a good text editor, my blog static site generator, a PDF viewer to do presentations, and a browser I can run the current conference software flavour of the month in. My MacBook Pro is there if I need something beefier, though it rarely leaves my desk now.

I only feel comfortable using Macs now *because* of FreeBSD. And a little NetBSD still too, but that's for another post.

