---
title: "Using HTTPS Debian repos with Ansible"
date: "2017-11-21T18:09:52+11:00"
abstract: "This originally appeared on the Annexe"
year: "2017"
category: Annexe
tag:
- ansible
- debian
- linux
- package-managers
- written-in-sydney
---
*This originally appeared on the Annexe.*

If you use popular third-party Debian repos such as Sury, you need the `apt-transport-https` package first. If you use Ansible:

    - name: Install dependencies
      apt:
        name: apt-transport-https
        state: present

    - name: Install sury repo key
      apt_key:
        url: "https://packages.sury.org/php/apt.gpg"
        state: present
    
    - name: Install sury repo
      apt_repository:
        repo: deb https://packages.sury.org/php/ {{ ansible_distribution_release }} main
        update_cache: yes

And naturally you're also filtering outbound firewall traffic too, because you're competent. In which case, make sure you're permitting https traffic too:

    - name: Enable outbound https
      ufw:
        rule: allow
        direction: out
        port: https

