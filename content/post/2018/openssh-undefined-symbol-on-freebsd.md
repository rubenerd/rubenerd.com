---
title: "OpenSSH undefined symbol on FreeBSD"
date: "2018-12-17T10:33:40+11:00"
abstract: "Chances are, you’ve got an incomplete freebsd-upgrade"
year: "2018"
category: Software
tag:
- bsd
- freebsd
- openssh
- security
- ssh
- troubleshooting
location: sydney
---
I had one of the more surreal experiences I've had since entering IT a decade ago. I was trying to SSH into a FreeBSD box, like a gentleman:

    $ ssh_exchange_identification: Connection closed by remote host

I ran SSH with the `-vvvv` verbosity flag, but it just terminated with the same line. Logs in `/var/log` didn't show anything.

What proceeded was a fruitless, head scratching debug process. The firewall for the box was set to accept my IPs. `ps aux` showed the daemon was running, and `netstat` showed it was on the correct port. The target drive had sufficient space. My pubkeys were in the right place, and all had the correct permissions. But weirdest of all, identical `sshd_config` files and pubkeys on other boxes worked.

The accepted wisdom at this stage is to run OpenSSH without daemonising, so you can see debug output. I ran this with a high port on the server:

    $ /usr/sbin/sshd -Ddp 22223

Then tried connecting:

    $ ssh <server hostname> -p 22223

Back on the server, I got this:

    ==> /usr/sbin/sshd: Undefined symbol "Fssh_get_remote_port"

Now we're getting somewhere. `undefied symbol` almost always means a version mismatch with the system. OpenSSH comes with base instead of the ports system, so I checked my `uname`, and it was running FreeBSD 11.1-RELEASE, even though everywhere else it referenced 11.2. So the issue was an incomplete `freebsd-upgrade`.

To resolve, I cleared existing downloads:

    # rm -rf /var/db/freebsd-update

Then forced FreeBSD update to upgrade, and supplied the version of the system:

    # freebsd-update -F -r 12.0-RELEASE \
        --currently-running 11.1-RELEASE upgrade
    # freebsd-update install

I restarted the machine, and I had FreeBSD 12.0-RELEASE, and SSH access.

