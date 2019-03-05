---
title: "Testing HTTPS/TLS sites"
date: "2019-02-26T08:23:40+11:00"
abstract: "And a caveat about inline CSS I’m not buying."
year: "2019"
category: Internet
tag:
- html
- mozilla
- privacy
- security
location: sydney
---
Two of the best tools for testing your HTTPS/TLS connection settings are the Qualys [SSL Server Test], and the [Mozilla Observatory] I only learned of yesterday.

They both test somewhat different metrics, so *Rubenerd* got an A+ from Qualys, but only a B+ from Mozilla. The great thing is they each offer suggestions, so I was able to get to an A+ with just a few changes.

My only caveat was this listed failure on the Mozilla Observatory:

> Blocks inline styles by not allowing 'unsafe-inline' inside style-src

I can see how removing inline styles would offer security benefits, but we've had it drummed into us for years that HTML `width` and `height` attributes are depracated in favour of CSS. It's infeasible for most sites to store sizes for every single image in a remote CSS file.
 
[SSL Server Test]: https://www.ssllabs.com/ssltest/
[Mozilla Observatory]: https://observatory.mozilla.org/

