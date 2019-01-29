---
title: "Can't use rbenv–installed Ruby?"
date: "2015-11-04T15:43:00+10:00"
abstract: "Forgot to issue rbenv local!"
year: "2015"
category: Software
tag:
- package-managers
- ruby
location: sydney
---
I’ve previously used RVM to install Ruby and gems, but this week I decided to try rbenv.

You can use Homebrew on the Mac, but I decided to install the standard way so I could also install ruby-build as a plugin the standard way. Standard:

    % git clone https://github.com/sstephenson/rbenv.git \
        ~/.rbenv
    % git clone https://github.com/sstephenson/ruby-build.git \
        ~/.rbenv/plugins/

Next, we need a version of Ruby. First check out what's available:

    % rbenv install -l
    ==> Available versions:
    ==>   1.8.6-p383
           [..]
    ==>   2.2.3

And then install:

    % rbenv install 2.2.3

Now we're cooking with gas. Check the version of Ruby, and we're set.

    % ruby -v
    ==> ruby 2.0.0p481 (2014-05-08 revision 45883) [universal.x86_64-darwin14]

Hey, wait a minute; that's the system Ruby. Why didn't I get the newer version? After I got over the internal dialogue, I realised I'd forgotten to tell rbenv which version to use.

    % rbenv local 2.2.3
    ==> [silence is golden]

Now we're cooking with... induction? Check the version of Ruby again, and we're set.

    % ruby -v
    ==> ruby 2.2.3p173 (2015-08-18 revision 51636) [x86_64-darwin14]

