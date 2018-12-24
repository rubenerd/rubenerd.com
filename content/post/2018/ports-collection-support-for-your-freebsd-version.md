---
title: "Ports Collection support for your FreeBSD version"
date: "2018-01-20T22:16:11+11:00"
abstract: "When a particually completed install breaks port installs"
year: "2018"
category: Software
tag:
- bsd
- freebsd
- troubleshooting
- written-in-sydney
---
I was upgrading a port on a FreeBSD box, like a gentleman:

    # cd /usr/ports/misc/p5-Chatbot-Eliza
    # make

And got this:

    /!\ ERROR: /!\

    Ports Collection support for your FreeBSD version has
    ended, and no ports are guaranteed to build on this 
    system. Please upgrade to a supported release.  
     
    No support will be provided if you silence this message 
    by defining ALLOW_UNSUPPORTED_SYSTEM.  
      
    make[1]: stopped in /usr/ports/misc/p5-Chatbot-Eliza
    *** Error code 1

But wait a minute, aren't I running the latest version?

    # uname -rs
    ==> FreeBSD 11.1-RELEASE-p6

Just to confirm though:

    # freebsd-version
    ==> 11.0-RELEASE-p16

Ah hah! When there's a mismatch like this, it usually indicates an incomplete upgrade:

    # freebsd-update fetch
    ==> You have a partially completed upgrade pending
    ==> Run '/usr/sbin/freebsd-update install' first.

Finishing the update install got me the correct version, and I was able to build the port.

    ==> ELIZA: And how does that make you feel?
