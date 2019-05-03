---
title: "Disabling SELinux on CentOS, RHEL"
date: "2019-04-22T10:23:52+10:00"
abstract: "Change SELINUX to disabled in /etc/selinux/config"
year: "2019"
category: Software
tag:
- centos
- redhat
- security
- selinux
location: Sydney
---
I had reason to disable SELinux on a VM. On CentOS and RHEL you can do temporarily with:

    $ sudo setenforce 0

To set permanently, change this flag in the following file:

    $ sed 's/SELINIX=enforcing/SELINUX=disabled/' \
        /etc/selinux/config

Filing here because I always forget.

