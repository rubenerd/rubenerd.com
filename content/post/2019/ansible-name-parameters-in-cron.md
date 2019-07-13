---
title: "Ansible name parameters in cron"
date: "2019-07-02T20:33:51+10:00"
abstract: "I finally started doing it the right way, and I got a deprecation warning. I always spell that depracataion for some reason."
thumb: "https://rubenerd.com/files/2019/nodoka-by-dingier@1x.png"
year: "2019"
category: Thoughts
tag:
- ansible
- bsd
- cron
- debian
- freebsd
- linux
- netbsd
location: Sydney
---
Speaking of Ansible, I was late to adding cron jobs [the right way](https://docs.ansible.com/ansible/latest/modules/cron_module.html) instead of using [lineinfile](https://docs.ansible.com/ansible/latest/modules/lineinfile_module.html). And immediately got this:

> [DEPRECATION WARNING]: The 'name' parameter will be required in future releases.. This feature will be removed in version 2.12. Deprecation
warnings can be disabled by setting deprecation_warnings=False in ansible.cfg.

I wasn't sure what name should be... did it need to be the name of the script or binary being executed? [From the docs](https://docs.ansible.com/ansible/latest/modules/cron_module.html)\:

> When crontab jobs are managed: the module includes one line with the description of the crontab entry "#Ansible: <name>" corresponding to the “name” passed to the module, which is used by future ansible/module calls to find/check the state. The “name” parameter should be unique, and changing the “name” value will result in a new cron task being created (or a different one being removed).

Okay, that makes sense. Done.

    cron:
      user: root
      name: "Earworm"
      job: "bennie-bennie-bennie-bennie-bennie-and-the-jets.pl"
      special_time: monthly


