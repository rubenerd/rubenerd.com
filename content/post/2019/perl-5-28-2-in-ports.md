---
title: "Perl 5.28.2 in ports and perlbrew"
date: "2019-04-23T23:01:46+10:00"
abstract: "An Easter::present :)"
year: "2019"
category: Software
tag:
- bsd
- freebsd
- perl
- perlbrew
location: Sydney
---
Everyone's favourite programming language is now at stable release version 5.28.2. [From the perldelta](https://perldoc.pl/perl5282delta):

> Perl 5.28.2 represents approximately 4 months of development since Perl 5.28.1 and contains approximately 2,500 lines of changes across 75 files from 13 authors.
> 
> Perl continues to flourish into its fourth decade thanks to a vibrant community of users and developers. The following people are known to have contributed the improvements that became Perl 5.28.2: Aaron Crane, Abigail, Andy Dougherty, David Mitchell, Karen Etheridge, Karl Williamson, Leon Timmermans, Nicolas R., Sawyer X, Steve Hay, Tina Müller, Tony Cook, Zak B. Elep.

A fix for the semi-notorious [GDBM test failures] didn't make it, but presumably it'll [be in for 5.28.3]. I wasn't personally bitten by it, but saw enough people mention on newsgroups and Twitter.

The indelible mat@ has updated Perl in [FreeBSD ports], and it's ready for [brewing] elsewhere. I'll consider this my secular `Easter::present` :).

[GDBM test failures]: https://rt.perl.org/Public/Bug/Display.html?id=133295
[be in for 5.28.3]: https://www.nntp.perl.org/group/perl.perl5.porters/2019/04/msg254455.html
[FreeBSD ports]: https://www.freshports.org/lang/perl5.28/
[brewing]: https://github.com/gugod/App-perlbrew/ "Perlbrew"

