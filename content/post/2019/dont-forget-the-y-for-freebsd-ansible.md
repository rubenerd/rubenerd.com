---
title: "Don’t forget the -y with FreeBSD Ansible"
date: "2019-06-24T18:20:09+10:00"
abstract: "Otherwise you’ll sit there waiting for Proceed with this action? [y/N]:"
year: "2019"
category: Software
tag:
- ansible
- asiabsdcon
- benedict-reuschling
- bsd
- freebsd
location: Sydney
---
Benedict Reuschling showed us last year how to use Ansible on FreeBSD at AsiaBSDCon. The key is to bootstrap Python using the raw module, so it can connect. I always thought the claim that Ansible didn't have dependencies was suspect ;).

I thought I was going crazy this afternoon when my bootstrap playbook seemingly sat there, doing nothing. I ran it with more verbosity, and saw the problem:

    Updating FreeBSD repository catalogue...
    FreeBSD repository is up to date.
    All repositories are up to date.
    The following 6 package(s) will be affected (of 0 checked):
        
    New packages to be INSTALLED:
        python3: 3_3
        python36: 3.6.8_2
        readline: 8.0.0
        indexinfo: 0.3.1
        libffi: 3.2.1_3
        gettext-runtime: 0.20.1

    Number of packages to be installed: 6
        
    The process will require 107 MiB more space.
    16 MiB to be downloaded.
        
    Proceed with this action? [y/N]: Terminated

It will happily just sit there waiting for your input. Using `-y` will assume the answer is yes.

