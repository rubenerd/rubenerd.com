---
title: "lighttpd in MacPorts"
date: "2007-11-28T04:26:55+00:00"
category: Software
tag:
- from-tumblr
- lighttpd
- mac-os-x
- macos
- macports
- os-x
- package-managers
---
From the MacPorts output:

    A startup item has been generated that will aid in 
    starting lighttpd with launchd. It is disabled by 
    default. Execute the following command to start it, 
    and to cause it to launch at startup:
    
    sudo launchctl load -w \
        /Library/LaunchDaemons/org.macports.lighttpd.plist
