---
title: "My personal RSA whoops"
date: "2018-10-17T22:17:28+11:00"
abstract: "When you sss-rsa yourself."
year: "2018"
category: Software
tag:
- errors
- openssh
- security
- ssh
- whoops
location: sydney
---
There's been much talk about [OpenSSH user enumeration vulnerabilities]. This is a more pedestrian post, or stationary one if you were sitting down.

I was bashing my head against a desk for the better part of twenty minutes last week, trying to figure out why my SSH key wasn't being accepted. I VNC'd into the box — because I use a cloud that can do that — and checked the `authorized_keys` file for the third time.

Can you see the issue? It took me leaving to get a coffee and coming back to notice immediately.

<p><img src="https://rubenerd.com/files/2018/rsa-whoops@1x.png" srcset="https://rubenerd.com/files/2018/rsa-whoops@1x.png 1x, https://rubenerd.com/files/2018/rsa-whoops@2x.png 2x" alt="Screenshot output from VNC showing my authorized_keys file" style="width:500px; height:240px;" /></p>

For those using screen readers, or if you haven't yet figured it out, the second key starts with `sss-rsa ssh-rsa` instead of just the latter. *Whoops!*

I'm still blown away that for all our intelligence, mine notwithstanding, we can be staring at something for so long the obvious becomes opaque. 

As an aside, I've also been moving to using `ed25519` where I can. Despite the name, the keys are much shorter and could almost be committed to memory if one were so inclined. Okay maybe not, but still far shorter than 4096-bit RSA.

[OpenSSH user enumeration vulnerabilities]: https://nvd.nist.gov/vuln/detail/CVE-2018-15473

