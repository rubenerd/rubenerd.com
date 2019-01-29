---
title: "Can’t killall on Debian 9 Stretch"
date: "2019-01-04T11:27:55+11:00"
abstract: "Install psmisc."
year: "2019"
category: Software
tag:
- debian
- linux
location: sydney
---
Trying to [kill] a process:

	$ killall process
	==> ash: 1: killall: command not found

Weird. 

	# apt-get update
	# apt-cache search killall
	==> psmisc - utilities that use the proc file system
	==> sysvinit-utils - System-V-like utilities

Must be more hot systemd garbage.

	# apt-get install sysvinit-utils
	==> sysvinit-utils is already the newest version

I stand corrected! Trying again:

	# apt-get install psmisc
	==> Unpacking psmisc [..] Setting up psmisc [..]

Let's try:

	$ killall process
	==> (exit 0)

Done!

[kill]: https://en.wikipedia.org/wiki/Kill_(command) "Kill command on Wikipedia"

