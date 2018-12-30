---
title: "Windows robocopy alternative to rsync"
date: "2016-07-23T12:04:00+11:00"
abstract: "This originally appeared on the Annexe."
year: "2016"
category: Annexe
tag:
- cygwin
- rsync
- windows
- written-in-sydney
---
*This originally appeared on the Annexe.*

Using robocopy:

    robocopy.exe "R:\Source" "\\host\Destination" /E /Z /R:3 /W:10 /V

Though I'd still prefer cygwin.

