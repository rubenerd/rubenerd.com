---
title: "Forcing Xen ACPI shutdown"
date: "2018-04-09T08:19:15+10:00"
abstract: "Using the -F flag, albeit in the wrong order!"
year: "2018"
category: Software
tag:
- debian
- linux
- xen
- virtualisation
- written-in-sydney
---
<figure><p><img src="https://rubenerd.com/files/2014/Xen-Fu-Panda-500px.png" alt="Xen's Panda mascot" style="width:250px;" /></p></figure>

If you've got a Xen domU [misbehaving], you can force an ACPI shutdown with the `-F` option.

For example, say you have the following:

    Name                  ID   Mem VCPUs  State Time(s)
- written-in-sydney
---
- written-in-sydney
---

To force shutdown domain 32:

    # xl shutdown -F 32  
    ==> /usr/lib/xen-4.9/bin/xl: invalid option -- 'F'
    ==> unknown global option

Or at least, I thought we could. Since when was `-F` an invalid option? Surely it wasn't a regression, or compatibility issue between the xm and xl toolstacks. I thought xl was broadly a drop-in replacement?

 Hey, wait a minute:

    # xl -F shutdown 32
    ==> Shutting down domain 32

I swear half my problems stem from misordered parameters. You should see me with `dd` when I'm [alone at night], it's late, and the decaf coffee failed to *placebo effectavise*. I'm fairly sure that isn't a word.

In my defence, *force* is an action to be applied to shutdown, so it looks like it should follow. There's also precedent for this order, for example:

    # diskutil unmount force
    # zfs umount -f
    # luxadm remove_device -F enclosurename,[f|r]slot#
    # ruben-moose.pl birdistheword --force

[misbehaving]: https://www.youtube.com/watch?v=j_G1WqTA-Us "Nat King Cole: Ain’t Misbehaving"
[alone at night]: https://www.youtube.com/watch?v=rAhH69D67DA "Michael Franks: Alone at Night" 

