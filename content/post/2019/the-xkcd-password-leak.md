---
title: "The xkcd password leak"
date: "2019-09-08T09:25:10+10:00"
abstract: "The urge for schadenfreude is strong among the tech press. We need to think bigger."
year: "2019"
category: Internet
tag:
- comics
- security
location: Sydney
---
I put xkcd in the same bucket as Rick and Morty; I get the jokes, but they're not my cup of tea. This is tantamount to heresy online, but surely even xkcd must have had a comic about forcing your preferences on others.

And that's part of the problem. Through no fault of Randall Munroe, xkcd has become gospel among certain vocal members of the infocomm community. You can't have a serious discussion without a URL to one of the comics being dropped like a [thought-terminating cliché](https://en.wikipedia.org/wiki/Thought-terminating_clich%C3%A9). It's tedious, predictable, and does little to progress discussions.

*We need a new standard? Yeah, but xkcd humourosly said it's not possible!*

So you'd think with xkcd's theme of password reuse, credential strength, and cryptographic hashing of late, I'd think it was deliciously ironic that its poorly-hashed forum password list was leaked, as plenty of well-known online publications gleefully reported.

No, I don't think that. My views on the comic aside, this breach will affect real people. Plenty of people reuse their passwords, as Randall himself has said. And those passwords will soon be known, given they were were stored with the now broken MD5 hash. I'm sure plenty of them are in rainbow tables already.

Security is also hard. If it weren't outdated forum software, it would have been a zero-day in userland, or a subtle kernel bug that can only be triggered under certain circumstances, or a misconfigured firewall, or a leaky sandbox/virtualisation guest. Heck, even your CPU could be leaking data.

The best thing we can do from these events is learn from them, and try and improve how we do things. There are secure ways to handle passwords, but in isolation and practice it's increasingly clear they're insufficient for authentication.

