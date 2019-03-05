---
title: "Homebrew no longer accepts options"
date: "2019-02-20T14:44:01+11:00"
abstract: "It’s not a good user experience, or so was decided."
year: "2019"
category: Software
tag:
- apple
- homebrew
- mac
- macos
- package-managers
location: sydney
---
I moved to [Homebrew from MacPorts in 2011], and [pkgsrc in 2008]. I liked how it kept brews in their own directory trees, that brew definitions were easy to read Ruby files, and the tooling was simple.

But then today I was trying to install PerlMagick, like a gentleman, and saw this error for the first time:

    $ brew install ImageMagick --with-perl
    ==> Error: invalid option: --with-perl

I'd been building with this for years. But sure enough, the options tool returning nothing:

    $ brew options ImageMagick
    ==> [crickets]

Something funky was going on. I did some digging, and in August last year [options were removed] from Homebrew. The justification was:

> Options in formulae don't produce a good user experience because they have to be built from source, we don't test them in CI and each combination of options provides a new chance for new failures to occur.

I'm `${ADJECTIVE}` disappointed, but I can empathise. Testing every permutation of options for every package isn't feasible, especially for a bootstrapped open source project. Failures would likely also be blamed on Homebrew over the original port. To a user experience engineer or designer, it's an obvious and easy win to remove this arguably lesser-used feature.

But that's not an issue with Homebrew, or package managers. It should be expected behavior that people are taking on more responsibility for a package if they build with custom options. That's why binary packages are installed by default; providing build options is an explicit directive to override what the maintainers have chosen.

This change effectively renders Homebrew a binary-only installer, in line with the Mac App Store. They're free to do this, but for those of us using Homebrew as the *missing package manager for macOS*, as per their own slogan, it renders it significantly less useful.

There will doubtlessly be well-intentioned workarounds suggested that are more complex than what we had before. Some of them may work great! But the message being sent is clear: package build options are a hindrance to user experience, and features critical to certain workflows may be revoked at any time.

I'll see if I can work around this, but it's also time to keep an open mind about other options. I appreciate all the hard work the Homebrew team have done over the years, but it's not as good a fit for my use case as it once was.

[Homebrew from MacPorts in 2011]: https://rubenerd.com/homebrew-mac-os-x/
[options were removed]: https://github.com/Homebrew/homebrew-core/issues/31510#issue-354224230
[DomT4 had words]: https://github.com/Homebrew/homebrew-core/issues/31510#issuecomment-418899106
[pkgsrc in 2008]: https://rubenerd.com/p2595/

