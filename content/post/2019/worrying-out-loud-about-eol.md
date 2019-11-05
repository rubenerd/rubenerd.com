---
title: "Worrying out loud about EOL"
date: "2019-10-19T10:53:40+11:00"
abstract: "60% of PHP websites use EOL'd PHP 5. This should worry all of us."
year: "2019"
category: Software
tag:
- php
- security
location: Sydney
---
Software is considered End of Life when the vendor no longer supplies updates and security patches; either overtly with strict timelines, or through abandonment. It can be frustrating as an end user or system administrator, but it's necessary given teams have finite engineering resources, and they're under pressure to release new versions.

But these economic realities, for want of a better phrase, apply equally to end users. An upgrade of an OS, or rewriting code against a newer framework version itself takes resources. This isn't to excuse administrators who run outdated software; feasibility studies must factor in ongoing maintenance, or a project shouldn't be considered. But circumstances change.

So at what point should software be considered too big to fail?

Take PHP 5. We all read the stores about its pending EOL status, but a year later and [60% of the PHP web still uses it](https://w3techs.com/technologies/details/pl-php/all/all). This is terrifying. Some OS vendors have taken it upon themselves to support it for another year, but there's every reason to believe it'll still be in wide use after this. Then what?

There are two options. We ignore the problem, shift the blame onto end users, and abandon old software. The temptation is there, but consider the users of those insecure sites, do they deserve to have their data leaked? I suppose one could say it would encourage people to only do business with reputable sites, but even they've been caught with outdated software.

The other option is to acknowledge this software is too big to fail, too much of the web depends on it, and do what we can to support it. Maybe we need an independent, industry-funded organisation that adopts abandoned software, even if just for security patches. Then software can be retired if and when it becomes technically infeasible to maintain it, not when an arbitrary deadline has passed.

*(Some would claim, perhaps only half-jokingly, that the Apache Software Foundation is just this. Fair enough I say, throw money at them!)*

The challenge then would be to convince the industry its in their interest to support such an organisation. It's awash with cash, but maybe we can do better than what happened with OpenSSL.

