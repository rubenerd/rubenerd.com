---
title: "Replace FTP client with NcFTP on High Sierra"
date: "2017-12-19T11:23:12+11:00"
year: "2017"
abstract: "High Sierra no longer bundles"
year: "2017"
category: Software
tag:
- ftp
- macos
---
macOS High Sierra no longer bundles an ftp client or server. Regardless of technical merit or justification, there are still large install bases for ftp, especially in embedded and legacy hardware. The same goes for telnet, but that's for another discussion.

For the client side, I've found [NcFTP] by the illustrious Mike Gleason a more than capable alternative. It works as a drop-in replacement interactively, and within scripts, as ftp. The only caveat is it handles auth differently.

Using standard ftp, you can create an age-old `.netrc` file:

    machine  <host>
    login    <username>
    password <password>

Then just log in as such:

    $ ftp <host>

NcFTP uses the concept of bookmarks instead. To create one, log in as normal:

    $ ncftp -u<username> -p<password> <host>
    
    ==> NcFTP 3.2.6 (Dec 04, 2016) by Mike Gleason (http://www.NcFTP.com/contact/).
    ==> Connecting to <host>...
    ==> Logging in...
    ==> User <username> logged in
    ==> Logged in to <host>.
    ==> ncftp / >

Then type `bookmark` to define one. It'll ask for a name; I just use the default hostname. Now you can log in like this:

    $ ncftp <hostname>

As with `.netrc`, caution must be exercised with `bookmark` definitions given you're storing plain text passwords. You'll also want to scrub your shell history if logging in interactively. 

<p style="font-style:italic">(I use an <a href="http://docs.ansible.com/ansible/latest/playbooks_vault.html">Ansible Vault</a> for deployments that need to interact with ftp. The ftp protocol itself also sends your password in the clear, but presumably you’re using it in an isolated environment or tunnel to mitigate this).</p>

As an aside, [this thread about removing FTP] is so typical. If you need to be a dick to make a point, as far as I'm concerned you've utterly conceded any point you were making.

[NcFTP]: http://www.NcFTP.com
[this thread about removing FTP]: https://forums.macrumors.com/threads/ftp-server-gone-from-high-sierra.2074332/

