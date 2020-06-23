---
title: "One-liners: Downloading a https cert as text"
date: "2020-06-02T17:17:29+10:00"
abstract: "$ openssl s_client -servername $URL -connect $URL:443 | openssl x509 -text"
year: "2020"
category: Software
tag:
- one-liners
- security
- ssl
- tls
location: Sydney
---
    $ openssl s_client -servername $URL -connect $URL:443 | openssl x509 -text
