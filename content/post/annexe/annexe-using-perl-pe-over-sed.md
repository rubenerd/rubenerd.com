---
title: "Using perl -pe over sed"
date: "2017-08-13T17:59:47+11:00"
abstract: "This originally appeared on the Annexe."
year: "2017"
category: Annexe
tag:
- perl
location: sydney
---
*This originally appeared on the Annexe.*

If you find `sed` limiting, you can use Perl instead:

    echo something | perl -pe 's/something/else/'

The [Perlrun command reference] lists the other flags you can use.

[Perlrun command reference]: http://perldoc.perl.org/perlrun.html#Command-Switches

