---
title: "Gigolo failed to mount Windows share"
date: "2020-03-15T23:34:16+11:00"
abstract: "Choose port 0 in FTP, then select Windows Share"
thumb: "https://rubenerd.com/files/2020/screenie-gigolo-bookmarks@1x.png"
year: "2020"
category: Software
tag:
- bsd
- bugs
- freebsd
- linux
- samba
- troubleshooting
- xfce
location: Sydney
---
[Gigolo](https://docs.xfce.org/apps/gigolo/start) is a unfortunately-named graphical frontend for accessing remote file servers on \*nix desktops. It's usually included with the Xfce desktop's goodies package bundles, such as in [FreeBSD ports](https://www.freshports.org/x11/xfce4-goodies/), but it doesn't have any Xfce-specific dependencies.

I kept encountering the same authentication error this afternoon while creating some new connection bookmarks. I confirmed connectivity to the remote server with `smbclient(1)` and within the [Thunar](https://docs.xfce.org/xfce/thunar/start) file manager on the same FreeBSD 12.1-R desktop, so why couldn't this do it?

<p><img src="https://rubenerd.com/files/2020/screenshot-gigolo-connection-refused@1x.png" srcset="https://rubenerd.com/files/2020/screenshot-gigolo-connection-refused@1x.png 1x, https://rubenerd.com/files/2020/screenshot-gigolo-connection-refused@2x.png 2x" alt="Connecting to $SERVER failed. Failed to mount Windows share: Connection refused." style="width:489px" /></p>

It wasn't until I saw the connection in the *Bookmarks* window that I saw the issue: the server was configured with FTP port 21 for some reason. And the problem is, you can't define a port once you select *Windows Share* in the *Create Bookmark* screen.

Theo Linkspfeifer explained a workaround in [Xfce bug report #16275](https://bugzilla.xfce.org/show_bug.cgi?id=16275)\:

> If you change the port to '0' before switching the connection type to "Windows Share", no port number will be added to the address.

This works. Here you can see an earlier connection I tried with the incorrect port, and another where I changed the port to 0 first before selecting *Windows Share*.

<p><img src="https://rubenerd.com/files/2020/screenie-gigolo-bookmarks@1x.png" srcset="https://rubenerd.com/files/2020/screenie-gigolo-bookmarks@1x.png 1x, https://rubenerd.com/files/2020/screenie-gigolo-bookmarks@2x.png 2x" alt="Screenshot showing no port in Edit Bookmarks" style="width:500px; height:208px;" /></p>
