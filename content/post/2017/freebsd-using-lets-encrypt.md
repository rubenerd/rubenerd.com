---
title: "FreeBSD.org using Let’s Encrypt"
date: "2017-11-28T11:36:11+11:00"
abstract: "Using openssl’s s_client to verify the website of the world’s favourite OS."
year: "2017"
category: Internet
tag:
- bsd
- freebsd
- https
- lets-encrypt
- security
- written-in-sydney
---
This is cool ^_^\:

    $ openssl s_client -connect freebsd.org:443
    ==> CONNECTED(00000005)
    ==> depth=1 C = US, O = Let's Encrypt, CN = Let's Encrypt Authority X3

For the record:

    $ openssl s_client -connect rubenerd.com:443
    ==> CONNECTED(00000005)
    ==> depth=1 C = US, O = Let's Encrypt, CN = Let's Encrypt Authority X3 

And a different kind of record:

    $ openssl s_client -connect www.cdbaby.com:443
    ==> CONNECTED(00000005)
    ==> depth=2 C = US, O = DigiCert Inc, OU = www.digicert.com, CN = DigiCert High Assurance EV Root CA

I shouldn't attempt puns so early in the morning.
