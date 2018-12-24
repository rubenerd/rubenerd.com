---
title: "RHEL also deprecating btrfs"
date: "2018-12-05T10:36:45+11:00"
abstract: "Whew."
year: "2018"
category: Software
tag:
- btrfs
- file-systems
- red-hat
- written-in-sydney
---
[Speaking of] the latest [Red Hat Release Notes], here's a decision that's a relief rather than a point of sadness:

> The Btrfs (B-Tree) file system is available as a Technology Preview in Red Hat Enterprise Linux 7.
> 
> Red Hat Enterprise Linux 7.4 introduced the last planned update to this feature. Btrfs has been deprecated, which means Red Hat will not be moving Btrfs to a fully supported feature and it will be removed in a future major release of Red Hat Enterprise Linux.

Canonical already sought legal advice to permit their use of CDDL-licenced ZFS in their Ubuntu distribution; I wonder if Red Hat will attempt something similar in the future?

Given many of the XFS maintainers now work at Red Hat, it seems likely they'll keep using that instead; perhaps even extend it. The performance is fantastic, but for data integrity ZFS is still without peer. Including, sadly, Apple's new APFS.

[Speaking of]: https://rubenerd.com/red-hat-deprecating-kde-with-reminiscing/
[Red Hat Release Notes]: https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/7/html-single/7.6_release_notes/ "7.6 Release Notes"

