---
draft: true
title: "From 1Password to KeyPass"
date: "2017-05-18T09:00:00+10:00"
---
I've been a 1Password user for many years now. It's the nicest password manager available for Mac, Windows and iOS, and they still have an offline version for the security concious. But Linux support has me onto KeePass, and I'm angry at myself for not checking it out sooner.

### Hackintoshes and Wine

My search for a cross-platform alternative to 1Password started when I built a game machine. I rapidly remembered how awful Windows was, so I dual booted it with the latest Fedora. I've been primarily a Mac user for years, but I've usually been careful to pick software I can run on Linux in case I ever needed to ditch it.

Unfortunately, 1Password Linux support isn't a priority. [This open thread] on the AgileBits forum has 38 pages dating back seven years. I appreciate their small team need to focus on their bread and butter, but I'd prefer an honest "we're not doing it" than stringing us on.

There are a couple of options, including dual booting this tower into a Hackintosh, or running the Windows client in Wine. I've done both enough times to know neither are worth it.

### Replacements

So what's the alternative? KeePass is the king of the roost for secure, cross platform password management, and the ecosystem has made big strides since I first researched it in 2014.

* **Mac:** [MacPass] is a native macOS client I think looks better - and uses more standard Mac controls - than 1Password. Point it at your KeePass manifest, and it just works.

* **Linux:** [KeePassXC] is a fork of the already-good [KeePassX] client with regular updates. It's cross-platform Qt, which looks and works just fine on Windows and Linux, especially if you rock KDE.

* **Firefox:** 

* **iOS:** MiniKeyPass on iOS works just fine.

### Migrating

This gentleman has an excellent script that will parse Dropbox's weird PIF format, and better yet its written in Perl. If you're going to use on your Mac, I strongly encourage you use Perlbrew, it'll make installing its few dependencies much easier.

[This open thread]: https://discussions.agilebits.com/discussion/2846/new-product-request-1password-for-linux

[MacPass]:

[KeePassXC]: 
[KeePass]: 

[MiniKeyPass]: 

