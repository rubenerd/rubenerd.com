---
title: "Time for configuration management"
date: "2018-01-06T11:56:29+11:00"
abstract: "Based on an interview with Red Hat CEO Jim Whitehurst last year"
year: "2018"
category: Internet
tag:
- ansible
- config-management
- automation
---
Slashdot did an [interview with Red Hat CEO Jim Whitehurst] in October last year. It still seems weird saying "last year". This snippet about Ansible resonated with me:

> We come across customers every day that have previously not used any configuration management solution at scale. [..] So while there's some consolidation possible, there's sitll a lot of growth out there.

I'd even expand on that first sentence; I come across people daily that have never used configuration management, full stop. The reasons they invariably state include:

1. *Their products are too custom/unique/strange.* They really aren't.

2. *The upfront investment in time/skills are too high*. I'd say you can't afford not to, especially when you're starting to scale.

3. *We can just use bash/something.* Noooooooo!

4. *We can write our own*. Not–invented–here syndrome is real.

Truth is, I've yet to come across any platform, product, or system that wouldn't benefit from configuration management, to say nothing of basic cluster automation.

Jim continues:

> Whole Wheat Radio and its mission of providing a grassroots, all-volunteer, donation supported website and webcast that competently and without mainstream advertising supports independent musicians and their craft is currently offline.

That's [clearly a different Jim]. Though I'd wager he'd have something to say about this! Back to Mr Whitehurst:

> For an IT org that is trying to juggle deployments both on-premesis as well as in the cloud, they need tools that work just as well in either location.

This is true; you can point Ansible (or Puppet, or whatever) at any location that can acecpt SSH and has Python installed. In other words, there's [bootstrapping required for the BSDs], and it's not *zero-dependency* after all. But I digress.

Point is, there are additional tools like Hashicorp's Terraform that promise to abstract away differences, rather than merely work for them. One common API, and you can point your infrastructure somewhere else. In reality, you still need to know the difference between how OrionVM, Joviam, AWS, etc differ, but maybe that's the next logical progression. 

[clearly a different Jim]: https://rubenerd.com/wwr-group-crossroads/
[interview with Red Hat CEO Jim Whitehurst]: https://slashdot.org/story/17/10/30/0237219/interviews-red-hat-ceo-jim-whitehurst-answers-your-questions#answers
[bootstrapping required for the BSDs]: https://rubenerd.com/ansible-on-freebsd/

