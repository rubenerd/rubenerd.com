---
title: "firewalld gotchas"
date: "2017-08-31T16:06:10+10:00"
abstract: "Most of these could easily be avoided by RTFM, but putting here anyway."
category: Software
tag:
- debian
- firewalld
- linux
- ubuntu
---
FreeBSD with OpenBSD's pf is preferable, but I've been learning [firewalld] on Debian. The console interface is almost as nice as [ufw], provided you avoid a few common gotchas.

### Gotcha one: confusing gotchas with Gatchas

<p><img src="https://rubenerd.com/files/2017/gatchaman-crowds@1x.jpg" srcset="https://rubenerd.com/files/2017/gatchaman-crowds@1x.jpg 1x, https://rubenerd.com/files/2017/gatchaman-crowds@2x.jpg 2x" alt="Official art from the Gatchaman Crowds anime from 2013" style="width:500px; height:435px;" /></p>

Oh Ruben, you've still got it.

### Gotcha two: removing services

All the intro guides I read describe how to add services to a zone, but not to delete them. If you do this:

    # echo "THIS EXAMPLE DOES NOT WORK"
    # firewall-cmd --zone=public --delete-service=ssh
    ==> Error: BUILTIN_SERVICE: 'ssh' is built-in service

This attempts to delete the service definition, not the service from that zone. You want the remove command:

    # firewall-cmd --zone=public --remove-service=ssh
    ==> success

### Gotcha three: not reloading after defining services

There are two ways to define your own firewalld service: quoting a port number directly, or creating a new service definition. The latter is preferable given the evilness of magic numbers, and can be achieved by copying an existing definition and seasoning to taste.

For example, if you wanted to run ssh on a different port:

    # cd /usr/lib/firewalld/services/
    # cp ssh.xml ssh-rubenerd.xml
    # sed -i 's/ssh/ssh-rubenerd/' ssh-rubenerd.xml
    # sed -i 's/22/33333/' ssh-rubenerd.xml

And then use it:

    # firewall-cmd --zone=public --add-service=ssh-rubenerd
    # ==> Error: INVALID_SERVICE: ssh-rubenerd

Wait, what? But didn't I just define it? I sure did, but I didn't reload firewalld first:

    # firewall-cmd --reload
    # firewall-cmd --zone-public --add-service=ssh-rubenerd
    # ==> success

### Gotcha four: confusing gotcha with matcha

No image this time, I think I've milked this joke for all it's worth. Which is unusual, because you wouldn't generally put milk in matcha tea.

### Gotcha five: using firewall-cmd

The `firewall-cmd` command is fine, but the best way to use it is to define your rules in Ansible, then load them in using the [firewalld module]!

    - firewalld:
        zone: public
        interface: eth1
        state: enabled
        permanent: true
     
    - firewalld:
        service: https
        permanent: true
        state: enabled
    
    - firewalld:
        rich_rule: 'rule service name="ssh" audit limit value="10/m" accept'
        permanent: true
        state: enabled

[ufw]: https://wiki.ubuntu.com/UncomplicatedFirewall
[firewalld]: http://www.firewalld.org
[firewalld module]: http://docs.ansible.com/ansible/latest/firewalld_module.html

