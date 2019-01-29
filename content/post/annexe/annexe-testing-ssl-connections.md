---
title: "Testing SSL connections"
date: "2017-01-03T11:08:00+11:00"
abstract: "This originally appeared on the Annexe."
year: "2017"
category: Annexe
tag:
- ssl
- tls
- openssl
- security
location: sydney
---
*This originally appeared on the Annexe.*

Using OpenSSL:

    openssl s_client -connect hostname.tld:443

And if you're testing an xmpp server:

    openssl s_client -connect hostname.tld:5222 -starttls xmpp

Use the `-ssl3` command if you know you're dealing with an older server.

