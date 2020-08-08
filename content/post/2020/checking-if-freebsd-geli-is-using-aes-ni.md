---
title: "Checking if FreeBSD geli is using AES-NI"
date: "2020-07-11T12:29:35+10:00"
abstract: "Use geli list and check for Crypto: hardware"
thumb: "https://rubenerd.com/files/uploads/icon.freebsd-logo.png"
year: "2020"
category: Software
tag:
- bsd
- cryptography
- freebsd
- security
location: Sydney
---
**[geli(8)](https://www.freebsd.org/cgi/man.cgi?query=geli&sektion=8)** is the interface to FreeBSD's preferred drive encryption system, similar in practical operation to [LUKS](https://linux.die.net/man/8/cryptsetup) on Linux, and [cgdconfig](https://rubenerd.com/encrypted-zfs-on-netbsd-9-for-a-freebsd-guy/) on NetBSD as I've recently learned. It can use the **[aesni(4)](https://www.freebsd.org/cgi/man.cgi?query=aesni&sektion=4)** kernel driver to interface with [AES-NI](https://software.intel.com/content/www/us/en/develop/articles/intel-advanced-encryption-standard-instructions-aes-ni.html) on compatible CPUs for better performance, or it performs cryptographic functions in software.

To use it you want to enable the appropriate drivers in **/boot/loader.conf**:

    aesni_load="YES"
    geom_eli_load="YES"

Then check whether your CPU supports AES-NI by looking at **[dmesg(8)](https://www.freebsd.org/cgi/man.cgi?query=dmesg&sektion=8)**:

    # grep AES /var/run/dmesg.boot

You should see something similar to the following:
        
    Features2=[...]AESNI[...]
    aesni0: <AES-CBC,AES-CCM,AES-GCM,AES-ICM,AES-XTS> on motherboard
    GEOM_ELI: Encryption: AES-XTS 256

If not, **geli** will continue to attach your devices but will warn you of your ancient hardware that you haven't got around to replacing cough, or your hypervisor isn't passing through AES-NI to its guests:

    aesni0: No AES or SHA support.
    GEOM_ELI: Encryption: AES-XTS 256

Once you've attached your **geli** devices, you can inspect **geli list** to check *how* the crypto is being performed. For example, this is one of my Xeon Microservers:

    Geom name: gpt/<SERIAL>.eli
    State: ACTIVE
    EncryptionAlgorithm: AES-XTS
    KeyLength: 256
    Crypto: hardware
    Version: 7

And here's a drive attached to my Celeron Microserver box that I should get around to rebuilding one day with AES-XTS. Note the use of software for crypto:

    Geom name: gptid/<SERIAL>.eli
    State: ACTIVE
    EncryptionAlgorithm: AES-CBC
    KeyLength: 192
    Crypto: software
    Version: 7

I'm not aware of a circumstance where AES-NI exists, **aesni** and **geom_eli** is loaded, and **geli** will still elect to preference software crypto, but I'd defer to the maintainers to say conclusively.

