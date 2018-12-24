---
title: "Ansible with FreeBSD"
date: "2017-03-14T10:09:00+10:00"
abstract: "Support is understandably less than Linux, but it can work."
category: Software
tag:
- bsd
- freebsd
- orchestration
- cloud-computing
- ansible
- written-in-sydney
---
I use Ansible where possible at work; it's really wonderful stuff for Linux. Unfortunately, its support for the BSDs has never been fantastic, evidenced by their zero-dependency claim when a Python interpreter is required!

Given the dearth of BSD Ansible material online, I thought I'd share some tips I've learned since trying it out. This is all valid as of Ansible 2.2.1.0.

### Bootstrapping a fresh FreeBSD install

Since I wrote my first playbooks, the [Ansible BSD docs] now list a process using the "raw" method to bootstrap dependencies on a fresh FreeBSD install:

    ansible -m raw -a "pkg install -y python" bsd_host

This itself makes some assumptions. The pkgng binary package manager is only available by default on 10.x and above, and requires bootstrapping with the "pkg" command first.

The [Joviam Cloud] makes it trivial to create a base FreeBSD image with required packages (such as Python, the Saltstack client, etc), clone from it as a template, and inject your SSH keys on start. I'll probably stick with this approach, but it's good to know we can get closer to starting from scratch.


### Using pkgng

Pkgng has been the default FreeBSD package manager since 10.0-RELEASE. Ansible includes a module for it, albeit with less support than the standard Linux tools. It should look familar to apt and yum users:

    - name: install/upgrade/confirm figlet package is installed
      become: yes
      become_method: sudo
      pkgng: 
        name: figlet
        state: latest

Unfortunately, it doesn't have a provision for package pinning. This is important so your custom builds from ports don't get clobbered by newer, generic builds in pkgng.


### Using Portinstall

Thesedays I try to use binary packages where possible. [nginx-devel] is the exception, because it doesn't include the [headers_more] extension which is all but mandatory now for privacy and SSL headers.

The portinstall module gives you:

    - name: verify nginx package is installed
      become: yes
      become_method: sudo
      portinstall: 
        name: www/nginx-devel
        state: present

What's not clear is how to define custom build options. You can drop to a shell to define them during the make process, but this isn't idempotent. Regardless of whether its installed or running, you'll be building it each time.

As I said above, because the pkgng module doesn't have a provision for pinning, a pkg upgrade will potentially overwrite your custom ports when a new version comes out. It should be easy enough to drop to a shell to do this, but its part of the workflow that still needs to be done manually.

### Conclusion

Ansible is a cinch on [Debian], and I want to use it on my personal FreeBSD boxes as well. Provided you only use binary packages and bootstrap it using the first process above, it works great. For custom ports, things get complicated quickly.

When I have more answers to these ambiguous cases, I'll share them here.

[Debian]: https://docs.ansible.com/ansible/apt_module.html
[Ansible BSD docs]: https://docs.ansible.com/ansible/intro_bsd.html
[Joviam Cloud]: https://joviam.com/
[portinstall]: https://docs.ansible.com/ansible/portinstall_module.html
[nginx-devel]: https://www.freshports.org/www/nginx-devel/
[headers_more]: https://github.com/openresty/headers-more-nginx-module 
