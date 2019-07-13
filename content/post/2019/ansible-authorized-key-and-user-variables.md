---
title: "Ansible authorized_key and user variables"
date: "2019-06-27T21:32:48+10:00"
abstract: "The user and authorized_key modules refer to users differently, which tripped me up!"
year: "2019"
category: Software
tag:
- ansible
- automation
- bsd
- debian
- freebsd
- linux
- netbsd
- scripting
- troubleshooting
location: Sydney
---
I haven't hidden my love and preference for Ansible here. Servers don't exist if they're not defined, provisioned, and maintained with Ansible playbooks, as far as I'm concerned. But it still manages to trip me up sometimes.

<p><img src="https://rubenerd.com/files/2019/nodoka-by-dingier@1x.png" srcset="https://rubenerd.com/files/2019/nodoka-by-dingier@1x.png 1x, https://rubenerd.com/files/2019/nodoka-by-dingier@2x.png 2x" alt="" style="width:500px" /></p>

Ansible can handle creating new users, and upload SSH keys. The OrionVM platform API, CLI, and web interface can inject SSH keys direct into running FreeBSD and Linux VMs, and into NetBSD VMs with a restart, but by default it adds them in the root user by default instead.

So I wrote some standard [user](https://docs.ansible.com/ansible/latest/modules/user_module.html) and [authorized_key](https://docs.ansible.com/ansible/latest/modules/authorized_key_module.html) blocks in a new playbook, and did a dry run:

    $ ansible-playbook freebsd-users.yml -test

    ==> TASK [Add key to user, like a gentleman] ***********************
    ==> fatal: [stuff.sasara.moe]: FAILED! => { "changed": false, 
    ==> "msg": "Unsupported parameters for (authorized_key) module: name 
    ==> Supported parameters include: comment, exclusive, follow, key, 
    ==> key_options, manage_dir, path, state, user, validate_certs" }

Whoops! I checked my pedestrian config, can you see the problem?

<pre>
- name: Add new user
    user:
      name: "{{ target_user }}"
      shell: /bin/sh
      groups: wheel
                    
- name: Add SSH key to user
    authorized_key:
      key: "{{ item }}" 
      exclusive: yes
      manage_dir: yes
      name: "{{ target_user }}"
      state: present
    with_file:
    - public_keys/id_ed25519_shonen_jumpbox.pub
</pre>

Yup, I'd used the name variable for both the `user` and `authorized_key` modules, but the latter uses `user` not `name`. So it should read as:

    - name: Add SSH key to user
        authorized_key:
          key: "{{ item }}" 
          exclusive: yes
          manage_dir: yes
          user: "{{ target_user }}"
          state: present
        with_file:
        - public_keys/id_ed25519_shonen_jumpbox.pub

I can see the justification here. The variable `name` in the context of SSH keys could refer to the user who accepts the key, or the name of key itself. The module doesn't contain a `name` variable at all, presumably to avoid this ambiguity.

Still, in practical terms this means the `user` module, and the `authorized_key` module which is only used on users, refer to users differently. There must be a German word for things that concurrently make sense and don't.

*Minimal Nodoka art from Negima by [dingier on DeviantArt](https://www.deviantart.com/dingier/art/Nodoka-Miyazaki-Negima-787223420), based on original art by the one and only [Ken Akamatsu himself](https://twitter.com/KenAkamatsu). My terrible, decade-old Mai-HiME NetBSD mashup got audible gasps at my AsiaBSDCon talk, I'm bringing them back! Maybe... not all the time.*

