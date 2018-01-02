---
title: "VirtualBox guest additions in Fedora 25"
date: "2017-05-15T13:42:00+10:00"
abstract: "Maybe you'll have better luck than me"
category: Software
tag:
- fedora
- linux
- troubleshooting
---
Fedora and I have a [long and colourful history] with screen issues. This is the latest chapter, today dealing with installing guest additions.

These are the dependencies:

    $ sudo dnf -y install gcc automake make kernel-devel kernel-headers perl

Then you can run:

    $ cd /var/run/media/[USER]/VBOXADDITIONS_[VER]
    $ sudo ./VBoxLinuxAdditions.run

    ==> vboxadd.sh: Building Guest Additions kernel modules.
    ==> Failed to set up service vboxadd, please check the log file
    ==> /var/log/VBoxGuestAdditions.log for details.

Welp, that didn't work. Checking the logs:

    ==> vboxadd.sh: failed: Please check that you have gcc, make,
    ==> the header files for your Linux kernel and possibly perl
    ==> installed

Maybe the kernel version and sources weren't the same. To be sure:

    $ sudo dnf install kernel*
    $ sudo shutdown -r now
    $ sudo dnf --best --allowerasing [above packages]

Done. So let's try again.

    $ cd /var/run/media/[USER]/VBOXADDITIONS_[VER]/
    $ sudo ./VBoxLinuxAdditions.run

    ==> vboxadd.sh: Building Guest Additions kernel modules.
    ==> Failed to set up service vboxadd, please check the log file
    ==> /var/log/VBoxGuestAdditions.log for details.

Welp, that didn't work. On the [VirtualBox issue tracker]:

> guest additions do not build with 4.8 kernel.  
> Got an error message while attempting to install guest additions in a 
> Fedora Rawhide guest for the 4.8.0-0.rc0.git2.1.fc26.x86_64 kernel 
> (worked with the last 4.7 kernel). 

The solution:

> The problem appears to be gone with VirtualBox 5.1.6. When installing 
> the latest kernel in my Rawhide guest, the error does not occur. 

This looks encouraging. What's my VirtualBox version?

> VirtualBox Graphical User Interface  
> Version 5.1.14

Welp, maybe it's a regression?

    % brew cask remove virtualbox virtualbox-extension-pack
    % brew update
    % brew install virtualbox virtualbox-extension-pack

Looks encouraging, much newer version.

    ==> Downloading [..] VirtualBox-5.1.22-115126-OSX.dmg
    ==> 🍺  virtualbox was successfully installed!

Let's start it up and try again in this Fedora guest.

    ==> Uncompressing VirtualBox 5.1.22 Guest Additions for Linux...........
    ==> VirtualBox Guest Additions installer
    ==> Removing installed version 5.1.14 of VirtualBox Guest Additions...
    ==> Copying additional installer modules ...
    ==> Installing additional modules ...
    ==> vboxadd.sh: Starting the VirtualBox Guest Additions.

Phew. The guest still has that [awful screen flicker] when you open a window (and this [previously-working hack] no longer fixes it), but I'll take it to get this work done.

[long and colourful history]: https://rubenerd.com/fedora-11-almost-awesome/
[Virtualbox issue tracker]: https://www.virtualbox.org/ticket/15713
[really awful screen flicker]: https://www.virtualbox.org/ticket/13653
[previously-working hack]: https://unix.stackexchange.com/questions/132005/screen-flickering-only-on-desktop-with-fedora-20-but-why

