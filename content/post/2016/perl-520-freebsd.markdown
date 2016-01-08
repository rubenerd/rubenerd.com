---
title: "Perl 5.20 in FreeBSD"
date: "2016-01-07T15:46:00+10:00"
summary: "Symlink has been moved"
category: Software
tag:
- bsd
- freebsd
- perl
---
Running [Perl][perl] in [FreeBSD][freebsd]? You should be [using env][env], but a heads up by the tireless maintainers:

    Message from perl5-5.20.3_8:
    The /usr/bin/perl symlink has been removed starting with Perl 5.20.
    For shebangs, you should either use:

    #!/usr/local/bin/perl

    or

    #!/usr/bin/env perl

    The first one will only work if you have a /usr/local/bin/perl,
    the second will work as long as perl is in PATH.

As an aside, the dependency list on the Perl5 FreshPorts page is among the most impressive I’ve ever seen. 6000+ packages require it to run, and as many to build.

[perl]: https://www.perl.org "The Perl Programming Language"
[freebsd]: https://www.freshports.org/lang/perl5.20/ "Perl5 in FreeBSD ports"
[env]: https://rubenerd.com/using-env-in-shebang-scripting-language-lines/ "Using env in shebang scripting language lines"
