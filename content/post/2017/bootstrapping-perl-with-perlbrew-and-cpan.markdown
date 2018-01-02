---
title: "Bootstrapping Perl with Perlbrew and CPAN"
date: "2017-09-04T17:37:07+10:00"
abstract: "Perlbrew is still the best way to install Perl in 2017."
category: Software
tag:
- package-managers
- perl
---
[@Stilgherrian] reminded me that there are still Perl devs out there. It can be a lonely existence, what with all these newfangled languages that don't act like Swiss Army Chainsaws. And [Perlbrew] by the illustrious [gugod and friends] is still the best way to get it, for three reasons:

1. It's Perl.

2. You'll likely get versions fresher than your [package manager of choice].

3. You can build environments with specific versions and packages for individual projects, where containers or ~~gaols~~ jails or whatever aren't practical. Drive space is cheaper than dependency hell.

The website lists full install details, but this is a self-explanatory use case:

    $ \curl -Lo install.sh https://install.perlbrew.pl
    $ cat install.sh
    $ sh install.sh
    $ echo "source ~/perl5/perlbrew/etc/bashrc" >> ~/.bashrc
    $ perlbrew install stable
    $ perlbrew switch perl-5.26.0

You should always inspect install scripts you download before running them, rather than just piping to your shell. For security obviously, and [others].

<p><img src="https://c2.staticflickr.com/8/7369/10549087343_e8bd93104a.jpg" srcset="https://c2.staticflickr.com/8/7369/10549087343_e8bd93104a.jpg 1x, https://c2.staticflickr.com/8/7369/10549087343_e8bd93104a_b.jpg 2x" alt="A Sasara anime figure from Clara on top of several Perl tomes" style="width:500px" /></p>

Now you have street cred, because you can ride camels on streets. Also, this folder exists in plain sight in your home directory. Why hide the pride like RVM?

    $ ls ~
    ==> perl5/

After opening a new shell, you'll want to confirm you're running with the version of Perl you expect:

    $ perl -v
    ==> This is perl 5, version 26, subversion 0 (v5.26.0) built for darwin-2level
    ==> (with 1 registered patch, see perl -V for more detail)

Then you can install your CPAN packages as per normal, such as [this one] by Karen Etheridge that I'd consider all but mandatory in 2017.

    $ perl -MCPAN -e 'install Acme::ಠ_ಠ'

[@Stilgherrian]: https://twitter.com/stilgherrian/status/904483298998550528
[Perlbrew]: http://perlbrew.pl
[gugod and friends]: https://github.com/gugod/App-perlbrew/graphs/contributors
[package manager of choice]: https://www.youtube.com/watch?v=wCDIYvFmgW8
[others]: https://www.seancassidy.me/dont-pipe-to-your-shell.html "Sean Cassidy: Don't Pipe to your Shell"
[this one]: https://metacpan.org/pod/distribution/Acme-LookOfDisapproval/lib/Acme/o_o.pm "meta::cpan - Acme-LookOfDisapproval"

