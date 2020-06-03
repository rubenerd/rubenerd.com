---
title: "Encrypted ZFS on NetBSD 9.0, for a FreeBSD guy"
date: "2020-05-24T09:13:30+10:00"
abstract: "Trying out ZFS and cgd on NetBSD for the first time."
thumb: "https://rubenerd.com/files/2019/screenie2008-maihime-netbsd@1x.jpg"
year: "2020"
category: Software
tag:
- bsd
- freebsd
- privacy
- openzfs
- zfs
location: Sydney
---
I had one of my other HP Microservers brought back from the office last week to help with this working-from-home world we're in right now. I was going to wipe an old version of Debian Wheezy/Xen and install FreeBSD to mirror my other machines before thinking: *why not NetBSD?*

<p><img src="https://rubenerd.com/files/2019/fleet-companioncube@1x.jpg" srcset="https://rubenerd.com/files/2019/fleet-companioncube@1x.jpg 1x, https://rubenerd.com/files/2019/fleet-companioncube@2x.jpg 2x" alt="" style="width:128px; float:right; margin:0 0 1em 2em;" /></p>

For people on Twitter asking why I'd want to, I discussed [where I use NetBSD](https://rubenerd.com/what-a-freebsd-guy-uses-netbsd-for/) in a post back in December, along with the below wallpaper that's become a running joke here! Some people were polite when asking, others... weren't so much. That's a heavier topic for another post.

But I digress: this in the [NetBSD 9.0 release notes](https://www.netbsd.org/releases/formal-9/NetBSD-9.0.html) that had me most excited:

> Updated ZFS. This is the first release with ZFS usable for daily use

**This is huge!** ZFS is the only file system I trust with data I care about, so to have that confidence along with a familiar and flexible toolchain on NetBSD is too cool. Of course I had to try it.

<p><img src="https://rubenerd.com/files/2019/screenie2008-maihime-netbsd@1x.jpg" srcset="https://rubenerd.com/files/2019/screenie2008-maihime-netbsd@1x.jpg 1x, https://rubenerd.com/files/2019/screenie2008-maihime-netbsd@2x.jpg 2x" alt="" style="width:500px; height:312px;" /></p>


### Setting up encryption

On FreeBSD I use GELI to provide encrypted devices to build my zpools on. I didn't have experience with doing this on NetBSD, but some reading of their always [excellent documentation](https://www.netbsd.org/docs/guide/en/chap-cgd.html) showed I could use the cryptographic device driver [cgd(4)](https://netbsd.gw.com/cgi-bin/man-cgi?cgd+4+NetBSD-9.0), and its [cgdconfig(8)](https://netbsd.gw.com/cgi-bin/man-cgi?cgdconfig+8+NetBSD-9.0) interface.

My Microserver had two 4.0 TB SATA drives, `wd0` and `wd1`. So the first step was to create cgd configuration files for these and back them up:

    # cgdconfig -g -o /etc/cgd/wd0 aes-xts 256
    # cgdconfig -g -o /etc/cgd/wd1 aes-xts 256

Then I needed to set passphrases. You can use the re-enter verification option so you know you've typed the passwords correctly.

    # cgdconfig -V re-enter cgd0 /dev/wd0
    # cgdconfig -V re-enter cgd1 /dev/wd1

Unmounting and mounting them again with my password confirmed they'd been configured correctly:

    # cgdconfig -u /dev/cgd0
    # cgdconfig -u /dev/cgd1
    # cgdconfig cgd0 /dev/wd0
    # cgdconfig cgd1 /dev/wd1


### Avoiding making puns about jumping into pools

Now I had `cgd0` and `cgd1`, which would broadly correspond to `ada0.eli` and `ada1.eli` in FreeBSD with GELI, for example. Which means setting up a basic ZFS pool is as easy as this:

    # zpool create tank mirror /dev/cgd0 /dev/cgd1

And sure enough, there it is: **an encrypted ZFS pool on NetBSD!** How friggen awesome is that!?

    # zpool status
      pool: tank
     state: ONLINE
      scan: none requested
    config:
        
            NAME        STATE     READ WRITE CKSUM
            tankaino0   ONLINE       0     0     0
              mirror-0  ONLINE       0     0     0
                cgd0    ONLINE       0     0     0
                cgd1    ONLINE       0     0     0


The next steps will be to research if I can (or should!) do ZFS send/receive with my FreeBSD ZFS boxes, what the performance delta is between them, and what parts of NetBSD are well suited for snapshotting, like my pkgsrc tree.


### Disclaimers

In production you should create a partition layout with [gpt(8)](https://netbsd.gw.com/cgi-bin/man-cgi?gpt+8+NetBSD-9.0) or [fdisk(8)](https://netbsd.gw.com/cgi-bin/man-cgi?fdisk+8+NetBSD-9.0), and a NetBSD cgd partition first before running the above. This would be equivalent to running gpart on FreeBSD rather just running GELI against a blank disk. It's good for so many practical reasons to label disks, but also because NetBSD's cgdconfig can be told to verify drive layouts like disklabels, gpt, etc. 

Cryptography is critical to get right, or it's not worth doing. **Read and follow the [official documentation](https://www.netbsd.org/docs/guide/en/chap-cgd.html)**, this post should only be treated as the fun proof of concept that it was.

