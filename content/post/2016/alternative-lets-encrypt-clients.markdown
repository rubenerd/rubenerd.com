---
title: "Alternative Let’s Encrypt Clients"
date: "2016-07-15T14:20:00+10:00"
year: "2016"
category: Internet
tag:
- bsd
- freebsd
- lets-encrypt
- netbsd
- ssl
- tls
---
I haven't blogged about Lets Encrypt yet, but I've been using it professionally and [personally] since it came out of beta, and am very impressed. I'd argue the client and automation even beat the fact its free.

To meet their goal of a universal and accessible client though, its necessarily large. For most projects I'd say run with the official and save yourself problems, but there may be times where you need something lighter weight. I’ve used two alternatives, and can vouch for their awesomeness.

### acme-tiny

This takes the form of a tiny Python script that works great unmodified on the Debian and CentOS VMs I’ve tried on [Joviam]. From the [acme-tiny repo]:

> This is a tiny, auditable script that you can throw on your server to issue and renew Let's Encrypt certificates. Since it has to be run on your server and have access to your private Let's Encrypt account key, I tried to make it as tiny as possible (currently less than 200 lines). The only prerequisites are python and openssl.

It does require manual steps, but then again that's why you're going with a light weight solution.

### letsencrypt.sh

This is my current favourite. As Ansible users would be keenly aware, FreeBSD and NetBSD don't ship with Python. I don't want to install an entire dependency chain to run a script from cron, so this works (though it still needs bash or zsh). From the [letsencrypt.sh repo]:

> This is a client for signing certificates with an ACME-server (currently only provided by letsencrypt) implemented as a relatively simple bash-script.
> 
> It uses the openssl utility for everything related to actually handling keys and certificates, so you need to have that installed.

There are dependencies, but are handled gracefully even with BSD/GPL differences:

> Other dependencies are: curl, sed, grep, mktemp (all found on almost any system, curl being the only exception)

FreeBSD and NetBSD users can use git-lite to pull the repo, or on FreeBSD you can just [install it from ports].

[personally]: https://www.ssllabs.com/ssltest/analyze.html?d=rubenerd.com
[diafygi and the devs]: https://github.com/diafygi/acme-tiny
[letsencrypt.sh repo]: https://github.com/lukas2511/letsencrypt.sh
[Joviam]: https://joviam.com/
[install it from ports]: https://www.freshports.org/security/letsencrypt.sh/

