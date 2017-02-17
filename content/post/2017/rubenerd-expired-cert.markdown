---
draft: true
title: "Rubénerd had an expired cert yesterday"
date: "2017-02-13T07:57:00+10:00"
abstract: "Whoops."
category: Internet
tag:
- letsencrypt
- weblog
---
I've noticed a steep rise in the number of personal and indie sites with HTTPS errors of late, and its almost always due to a lapsed [Let's Encrypt] certificate.

Unlike regular certs, Let's Encrypt specimens can be generated for free at any time, so the philosophy is to reduce the attack window and generate them every few months instead of years. It makes sense, but the burden is on sysadmins to make sure the agent is running properly, or the cert lapses.

I say this not to judge, because it struck *Rubénerd* yesterday, whoops. William Hales was the first to report it; for that he earns the *Honorary Rubenerd Sysadmin* for February 2017!

In the email, William asked what stack I was running. It isn't fancy; it's a lone cloud server running [FreeBSD] with [nginx], [dehydrated] for Let's Encrypt, and [Ansible] for orchestration. No load balancers or anything, which gives me even less of an excuse to have an expired cert.

Realistically, it doesn't even *need* an cert in the first place, and could run just fine on shared hosting or Github Pages, but *Rubénerd* has always been an over-engineered experiment to learn new stuff anyway.

I've adjusted cron to reload nginx after generating new certs so this doesn't happen again. Maybe!

[Let's Encrypt]: https://letsencrypt.org/
[FreeBSD]: https://www.freebsd.org/
[nginx]: https://nginx.org/
[dehydrated]: https://github.com/lukas2511/dehydrated
[Ansible]: https://ansible.com/

