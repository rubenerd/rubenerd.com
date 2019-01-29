---
title: "Mosh on Amazon Lightsail"
date: "2018-09-28T17:40:32+10:00"
abstract: "Mosh’s sanity-maintaining buffering in remote availability zones"
year: "2018"
category: Internet
tag:
- amazon
- aws
- guides
- lightsail
- firewalls
- security
- ssh
location: sydney
---
[Amazon Lightsail] is great for getting something up quickly, but the default firewall rules preclude using [mosh]. I can't imagine accessing remote availability zone instances without mosh's sanity-maintaining buffer.

### Opening the right ports

1. Log into your AWS portal and choose *Lightsail*. I include this as a discrete step, though if you need to be told this, you may need more coffee.

2. Click the dropdown menu for the VM and choose *Manage*, then choose the *Networking* tab. 

3. Under the *Firewall* heading, click *Add another*. Choose *Custom* for the *Application*, *UDP* for the *Protocol*, and a *Port* from `60000` to `61000` inclusive. And hit *Save*.

### Installing mosh

Now you can install mosh as you would normally. I use Colin Percival's excellent FreeBSD AMI on the server, because I'm a gentleman:

    # pkg install www/mosh

And then on my macOS clients:

    # brew install mosh

[Amazon Lightsail]: https://lightsail.aws.amazon.com/ls/webapp
[mosh]: https://mosh.org/ "The Mobile Shell"

