---
title: "lighttpd in MacPorts, part of twos"
date: "2007-12-02T03:17:28+00:00"
category: Software
tag:
- from-tumblr
- lighttpd
- macports
- macos
- mac-os-x
- os-x
- package-managers
---
Post install from MacPorts:

    Before starting lighttpd it must be configured. Lighttpd 
    is configured by editing 
    /opt/local/etc/lighttpd/lighttpd.conf. There’s a sample 
    config file at 
    /opt/local/etc/lighttpd/lighttpd.conf.default. Please 
    note that the launchd daemon relies on the PID being at 
    /opt/local/var/run/lighttpd.pid.

