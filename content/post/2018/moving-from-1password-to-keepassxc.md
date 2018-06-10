---
title: "Moving from 1Password for KeePassXC"
date: "2018-04-18T17:41:24+10:00"
abstract: "I need offline cross-platformness, which 1Password doesn't have."
thumb: "https://rubenerd.com/files/2018/keepass@1x.png"
year: "2018"
category: Software
tag:
- security
- passwords
- linux
- bsd
- freebsd
- mac
- macos
- os-x
- mac-os-x
---
<p style="font-style:italic">This post was originally written on the 12th of April, but wasn’t pushed for some reason.</p>

1Password is the best password manager available. It's the most user friendly, auto-fills the most intelligently, and has the cleanest interface. It's also from Canada, where they [pay millions] for our [shared royal family] to tour around as well. *God save the Queen, who lives somewhere else!*

It's also not cross-platform. Their support team said they'd *never say "never"* to a Linux port, and therefore the potential to run it on FreeBSD without Wine, but that was [eight years ago]. Now that I use FreeBSD on the desktop again, I'm after alternatives.

<p><img src="https://rubenerd.com/files/2018/keepass@1x.png" srcset="https://rubenerd.com/files/2018/keepass@1x.png 1x, https://rubenerd.com/files/2018/keepass@2x.png 2x" alt="KeePassXC icon" style="width:128px; height:128px; float:right; margin:0 0 1em 1em;" /></p>

[KeePassXC] fits the bill. KeePass is the *defacto* standard now, and KeePassXC is broadly the latest maintained version. In short, they've done a great job.

What's particularly nice about KeePassXC is its [official Firefox plugin] that negates the need for [KeePassHTTP] for password auto-fill. You:

1. unlock your KeePassXC database;
2. enable the Firefox browser integration;
3. install the Firefox plugin;
4. go to a site in Firefox and authorise it; and
5. henceforth, choose your login from a dropdown on forms. Boom!

On the FreeBSD side, it's available in the [ports tree] and only really brings in some Qt dependencies. That would have bugged me a decade ago when I was trying to keep my desktop environments limited to Qt on KDE or GTK on Xfce, but *ain’t nobody got time for that now*. If YubiKey support is needed, you'll need to make config and build. 

There seems to be growing interest in migrating from 1Password Vaults to KeePass databases, based on blog posts and Github projects. For now I've been manually migrating things across as an excuse to clear out old cruft.

If it works well over the next month or so, I'll channel the licence fee or a few months of [subscription eels] I would have spent buying 1Password for my dad on a donation to them instead :).

[KeePassXC]: https://keepassxc.org/
[official Firefox plugin]: https://addons.mozilla.org/en-US/firefox/addon/keepassxc-browser/
[pay millions]: https://en.wikipedia.org/wiki/Royal_tours_of_Canada_by_the_Canadian_Royal_Family "Wikipedia: Royal tours of Canada"
[shared royal family]: https://en.wikipedia.org/wiki/Royal_visits_to_Australia "Wikipedia: Royal tours of Australia"
[ports tree]: https://www.freshports.org/security/keepassxc/ "KeePassXC in the FreeBSD ports tree"
[subscription eels]: http://www.merlinmann.com/roderick/ep-134-a-minimum-of-eels.html "The episode of Roderick on the Line where John discusses how he feels accumulating subscriptions is akin to having more and more eels hanging off you, until you fall over from the weight. I think it's a deligtfully terrifying metaphor."
[KeePassHTTP]: https://github.com/keepassxreboot/keepassxc/blob/develop/README.md#note-about-keepasshttp "Link to a warning about KeePassHTTP security"
[eight years ago]: https://discussions.agilebits.com/discussion/2846/new-product-request-1password-for-linux "1Password for Linux product request from 2010"
