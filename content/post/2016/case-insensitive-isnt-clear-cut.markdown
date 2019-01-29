---
title: "Case-insensitive file systems aren't clear cut"
date: "2016-12-10T10:48:00+10:00"
abstract: "Means different things in different contexts"
year: "2016"
category: Software
tag:
- bsd
- file-systems
- freebsd
- linux
- netbsd
- os-x
- samba
- windows
location: sydney
---
<p style="font-style:italic">This was originally drafted in August 2015, and discovered in my drafts folder yesterday. I suspect I wanted to include ZFS examples, but never did.</p>

Case-sensitive file systems are a thorny issue. \*nix servers of all stripes defualt to case-sensitive file systems, but desktop OSs have long preferred case-insensitive to make life easier for end users.

When I'm building one of my over-engineered FreeBSD ZFS NAS boxes for Mac clients, I employ case-insensitivity. It avoids a lot of pain, such as end-users getting confused when the OS asks if you want to overwrite sukumizu.txt and SUKUMIZU.txt. Some desktop applications also don't handle case-sensitive file systems gracefully.

Unfortunately, rendering life easier in userspace shifts the complexity to the sysadmin. Like always!

While case-sensitivty is straight forward (relatively), case-insensitivty can mean different things depending on the file system, OS, shell, or other interface. Worse still, there seems to be little consistency to the nomenclature.

* Files can be stored in any case, but can't be referenced or auto-completed in any case. This is what usually happens on Linux file systems formatted with case-insensitivity, because year of the Linux desktop. 

* Files can be stored in any case, and can be referenced and auto-completed in any case. This is how Mac OS X and Windows deal with files.

* Files are limited to one case. This is like DOS, CP/M and GEOS running on your Commodore 128. They came out one year before I was born, and I still feel old knowing about these systems.

The other issue is normalisation. How does the target file system map two characters as being the same? Unicode stores similar (or even identical characters) in multiple places. Others, like latin characters with accents, can be constructed in multiple ways.

It reminds me of what my first IT boss said, don't ever ask an engineer a yes/no question.

