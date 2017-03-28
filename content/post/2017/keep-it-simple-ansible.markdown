---
title: "Keep it simple, Ansible"
date: "2017-03-26T11:29:00+10:00"
abstract: "If something feels complicated, it probably is"
category: Software
tag:
- ansible
- bsd
- freebsd
- linux
- netbsd
---
In case my love for Ansible weren't obvious, I thought this line in their [best practices] section was great:

> Keep It Simple  
> 
> When you can do something simply, do something simply. Do not reach to use every feature of Ansible together, all at once. Use what works for you. For example, you will probably not need vars, vars_files, vars_prompt and --extra-vars all at once, while also using an external inventory file.
> 
> If something feels complicated, it probably is, and may be a good opportunity to simplify things.

One of my old programming lecturers once said clear code was better than clever code. I think that applies to sysadmins as well.

[best practices]: https://docs.ansible.com/ansible/playbooks_best_practices.html

