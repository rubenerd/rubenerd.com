---
title: "Python interpreter for Ansible"
date: "2017-03-21T10:28:00+10:00"
abstract: "The other elephant in the room when used with FreeBSD"
year: "2017"
category: Software
tag:
- ansible
- bsd
- freebsd
- python
- written-in-sydney
---
Last week I talked about [using Ansible for FreeBSD automation], but forgot to address the other elephant in the room: Ansible can't find Python on FreeBSD hosts.

### The problem

As per its Linux heritage, Ansible defaults to the following Python path:

    /usr/bin/python

FreeBSD (and NetBSD, and Solaris, and macOS with Homebrew, et.al) put Python elsewhere, which Ansible can't find. It's a curious design decision, we've had the following portable shebang recommended for years:

    #!/usr/bin/env python

[This issue thread] suggests the Ansible developers don't see this as a bug. So it's up to us to work around it for platform-agnostic playbooks.

### Solution 1: Symlinks

As part of your bootstrapping process, you can install Python from pkgng or ports, then symlink:

    # ln -s /usr/local/bin/python /usr/bin/python

This works, but is fragile and nasty. We can do better.

### Solution 2: Grouped FreeBSD hosts

In your Ansible hosts or inventory files, group your FreeBSD hosts and apply a var to them:

    [freebsd]
    houki
    charlotte

    [freebsd:vars]
    ansible_python_interpreter="/usr/local/bin/python"

### Solution 3: All hosts

If you only target FreeBSD hosts, you can set the var for all hosts:

    [freebsd:vars]
    ansible_python_interpreter="/usr/local/bin/python"

### Solution 4: All hosts for env Python

Hey wait a minute, I've got an idea. You can do the same thing as above, even if you have a mix of different hosts:

    [all:vars]
    ansible_python_interpreter="/usr/bin/env python"

Huzzah, it works! This will now become part of my Ansible boilerplate.

[This issue thread]: https://github.com/ansible/ansible/issues/6345 "Introduce ANSIBLE_PYTHON_INTERPRETER env variable"
[using Ansible for FreeBSD automation]: https://rubenerd.com/ansible-on-freebsd/ "Ansible with FreeBSD"

