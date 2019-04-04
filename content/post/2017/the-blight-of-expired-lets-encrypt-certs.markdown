---
title: "The blight of expired Let’s Encrypt certs"
date: "2017-05-13T10:50:00+10:00"
abstract: "They're having an unintended side effect"
year: "2017"
category: Internet
tag:
- lets-encrypt
- privacy
- security
- ssl
- tls
location: sydney
---
As Let's Encrypt has made it affordable and easy to generate and install HTTPS certificates, so too have the number of sites exploded with expired certificate warnings.

<figure><img src="https://rubenerd.com/files/2017/expiredle@1x.png" alt="Expired Let's Encrypt certificate warning in Safari" style="width:500px; height:337px" srcset="https://rubenerd.com/files/2017/expiredle@1x.png 1x, https://rubenerd.com/files/2017/expiredle@2x.png 2x" /></figure>

In the past, a certificate was an investment. You treasured it, and (mostly) kept it current. Now they're becoming disposable.

I don't fault Let's Encrypt for this. The official client, and most of the others, provide instructions on setting up a cron job to generate them regularly. But it's an interesting side effect.

Peversely, if we're concerned with people clicking through expired cert warnings without reading or caring, this latest trend is only going to reinforce it.

<p style="font-style:italic">(As an aside, a couple of readers have asked why I keep referring to these as **HTTPS** rather than **SSL** certificates. Crypto people are nothing if not precise, and **SSL** is not offered on Rubenerd, or most other sites any more. The newer versions of the standard are called, rather short-sightedly, **TLS**. But that name holds even less mindshare outside the IT industry).

