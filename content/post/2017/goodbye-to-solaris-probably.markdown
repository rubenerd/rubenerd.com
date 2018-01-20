---
title: "Goodbye to Solaris, probably?"
date: "2017-09-05T18:18:23+10:00"
year: "2017"
abstract: "Much of the Solaris team has been fired from Oracle. What now?"
year: "2017"
category: Software
tag:
- opensolaris
- oracle
- solaris
- unix
---
*[Betteridge's Law]* states headlines ending with a question mark can be answered with **no**. I hope he's right in this case, because the situation for Solaris users and fans is looking increasingly dire. 

Since Oracle bought Sun on that fateful day in 2010, we've witnessed dozens of products get dropped, but the idea of Solaris being among them still seemed so far off, even if the OS itself did seem to be falling out of favour.

On the advertising front, there was Oracle's push of "software and hardware engineered to work together". It was in all their slides and graphics and site footers; a kind of Apple pitch for the enterprise. I read that, albeit with reservations, to mean an in-house stack, from SPARC, to Solaris, to some Java middleware, to a fat Oracle DB.

Oracle was quick to close-source Solaris, but also kept up development. You can still free-beer download version 11.x, and have inline ZFS encryption and other extra niceties. I ran it as a fun experiment on one of my HP microsevers, and never got around to replacing it. Not the most glowing endorsement, but there we are!

The tenuous situation with Solaris came to the fore with the [now-infamous tweet] from Simon Phipps:

> For those unaware, Oracle laid off ~ all Solaris tech staff yesterday in a classic silent EOL of the product.

Ouch. And in terms of Oracle's future plans, [Simon Sharwood wrote]:

> Oracle has committed to support Solaris until the 2030s, so users aren't going to be orphaned. But if the company is slowing SPARC development it suggests that even the cloud may not be available as an escape route for users of the platforms Oracle acquired from Sun. Which in turn suggests that Oracle's plan to build a SPARC-powered cloud hasn't been well-received.

That's a topic for future thoughts and postings, but for now it does seem to signal the death-knell. These [cloud migration plans] also sound worrying on the surface, though I'm willing to defer judgement till we get more details.

Solaris is huge, entrenched, and in more enterprises than many of the pundits I've read seem to appreciate. Hence, the long term support. But I couldn't blame anyone in a decision-making position at a nimble enough company to be weighing up their options now. Especially since even Oracle is pushing Linux.

I originally thought my first \*nix was Red Hat, but I remember now the first one I ever interfaced with was a blinking SunOS console at school. I wrote and submitted all my Java assignments at university to an old Solaris box. I've also been interested in its lineage and use in the context of the BSDs, given I've generally preferred them over Linux.

It's sad to witness this latest news, but truth be told Solaris had started fading long before this announcement. More power to illumos and the distro maintainers with their open-source fork, I may [give them a try again].

[Betteridge's Law]: https://en.wikipedia.org/wiki/Betteridge%27s_Law_of_Headlines
[now-infamous tweet]: https://twitter.com/drewfisher314/status/903804762373537793
[Simon Sharwood wrote]: https://www.theregister.co.uk/2017/09/04/oracle_layoffs_solaris_sparc_teams/
[cloud migration plans]: https://www.theregister.co.uk/2017/09/05/solaris_update_plan_is_real_but_its_future_looks_cloudy_by_design/
[give them a try again]: https://rubenerd.com/opensolaris-macbook-pro/

