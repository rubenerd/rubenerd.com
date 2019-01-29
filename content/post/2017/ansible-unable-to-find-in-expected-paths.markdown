---
title: "Ansible: Unable to find in expected paths"
date: "2017-09-10T22:02:00+10:00"
abstract: "Turns out, you need to use the remote_src attribute"
year: "2017"
category: Software
tag:
- ansible
- orchestration
location: sydney
---
I was copying a file on a remote server to another location, to modify with required settings. I often prefer this to using templates, so I'm always working with the latest config. 

    - name: Move config to expected place
      copy:
	  src: "[SOURCE FILE]"
        dest: "[DESTINATION FILE]"
        force: no  ## don't overwrite

But when I ran the playbook:

	fatal: [IP]: FAILED! => {  
        "changed": false,  
        "failed": true,  
        "msg": "Unable to find '[SOURCE FILE]' in expected paths."  
    }

***Turns out***, `copy` transfers from local to remote by default, so it couldn't find it. If you include the following directive, the source is defined as remote: 

    [..]
    remote_src: yes

Done.

