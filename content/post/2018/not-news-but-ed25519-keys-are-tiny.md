---
title: "Not news, but ed25519 keys are tiny"
date: "2018-11-26T08:13:03+11:00"
abstract: "We’re almost in memorisation territory"
year: "2018"
location: Sydney
category: Software
tag:
- bsd
- cryptography
- freebsd
- linux
- netbsd
- openbsd
- openssh
- security
- ssh
---
I owe a significant proportion of my livelihood and personal life to OpenSSH. You likely do too, perhaps without even knowing it. It makes me think where more donation dollars should be going.

RSA keys are still the default, and 2048 bits are still considered sufficient according to the manpage. This is still true, but I use 4096 now given they doesn't take that much longer on modern hardware to generate and verify:

    $ ssh-keygen -t rsa -b 4096

But since 2017 I've been defaulting to ed25519, which has a fixed key length:

    $ ssh-keygen -t ed25519

These are generated much quicker, but the real advantage is the keylength itself. My 4096 bit RSA keys private keys are ~3.2 Kb in size, but my ed25519 ones are 464 bytes, six times smaller.

This doesn't sound all that significant, until you see an example publuc key:

    ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMT6zUImsLj7b5xmHJnqflB9pg5rnnXFZlYHUQVxhAFd

At that size, we're getting into memorisation territory. Trying to bootstrap a new machine, or forgot to bring your keychain? No problem! I say *getting into*, because my memory is awful enough not to make it feasible. But I could see a sufficiently motivated person doing it.

As an aside, the ASCII art for that throwaway key was also oddly interesting. My blearly morning eyes saw a double helix, but all I can see now is an airline seat.

    +--[ED25519 256]--+
    | +o..E.          |
    | oo  . .         |
    |. . . .    .     |
    | . . .. ..+ o    |
    |.   =. .SO B .   |
    |.  . =.o=.+ +    |
    | .o = +.o o.     |
    |.o+= + ... +..   |
    | ++o. ..  .o=    |
    +----[SHA256]-----+

