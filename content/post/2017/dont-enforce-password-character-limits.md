---
title: "Don’t enforce password character limits"
date: "2017-01-03T15:35:00+11:00"
abstract: "They get saled and hashed either way."
year: "2018"
category: Software
tag:
- passwords
- security
- written-in-sydney 
---
MyBB sites, such as forum.vyos.net, enforce bad password policies:

> Please correct the following errors before continuing: The password you entered is of invalid length. Please enter a password between 6 and 30 characters.

The 30-character limit doesn't matter, it gets salted and hashed either way. It's an entirely arbitrary limit that renders passwords *less* secure. Don't do it.

Even better, call then passphrases, because that's what they should be.

