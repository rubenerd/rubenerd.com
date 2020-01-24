---
title: "fetch: authentication error on FreeBSD"
date: "2020-01-24T19:28:47+11:00"
abstract: "Install ca_root_nss or use --no-verify-peer"
year: "2020"
category: Software
tag:
- bsd
- freebsd
- troubleshooting
location: Sydney
---
If you download a file over TLS with `fetch(1)` in FreeBSD base and get the following error...

    # fetch https://$URL
    fetch: https://$URL: Authentication error

... it means you don't have a certificate store installed for `fetch` to validate the site's certificate against. Here's the Mozilla one you can use, with the usual caveats and warnings about checking this yourself before installing:

    # pkg install -y ca_root_nss

You can also download without verifying the certificate. Which you **definitely shouldn't do** unless under extenuating circumstances:

    # fetch --no-verify-peer https://$URL

As an aside, `fetch` is pretty great. I made it a challenge to run more stock FreeBSD last year, and I've been using it in lieu of `curl` (and I suppose `wget`) I do miss being able to specify ranges in curl, but it's nothing a shell script to feed `fetch` a range of addresses to couldn't fix. It's also [available in pkgsrc](http://pkgsrc.se/net/fetch) thanks to joerg@.

*(I even had a third party tool I was using that expected curl, which I aliased to a script that fed the URL to fetch. I can't say this is good practice at all, but it worked!)*


