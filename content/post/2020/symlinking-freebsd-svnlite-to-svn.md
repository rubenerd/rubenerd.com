---
title: "Symlinking FreeBSD svnlite to svn"
date: "2020-01-29T08:15:10+11:00"
abstract: "Ansible can’t tell the difference, so it works!"
thumb: "https://rubenerd.com/files/2020/thumb-subversion.jpg"
year: "2020"
category: Software
tag:
- ansible
- bsd
- freebsd
- subversion
- wordpress
location: Sydney
---
I was deploying a WordPress install for a friend over the weekend, and was about to run this part of a well-used Ansible playbook:

    - name: Install Subversion
      pkgng:
        name: subversion
        state: present    
        
    - name: Pull WordPress
      subversion:
        dest: "/var/www/{{ slug }}/wordpress"
        repo: "https://core.svn.wordpress.org/tags/{{ wp_version }}"

But then I remembered my New Year's resolution to use more from FreeBSD base, rather than automatically reaching for ports. There's a more than capable [svnlite client](https://www.freebsd.org/cgi/man.cgi?query=svnlite&sektion=0), which makes sense given you might need one to pull the ports tree before you can download subversion.

Peter's comment in [revision 251886](https://svnweb.freebsd.org/base?view=revision&revision=251886) back in 2013 advises it should work with this relatively small repository:

> To be absolutely clear, this is not intended for any use other than checking out freebsd source and committing, like we once did with cvs. It should be usable for small scale local repositories that don't need the python/perl plugin architecture.

But would it work with Ansible? I symlinked the FreeBSD `svnlite(1)` client to `svn` in `/opt`, which is where I stash my own binaries and scripts:

    - name: Symlink svnlite to svn
      file:
        src: /usr/bin/svnlite
        dest: /opt/bin/svn
        state: link

    - name: Pull WordPress
    ...

I ran the playbook again, and it worked!

The next step would be to see if Ansible can be supplied a subversion path, rather than using a symlink.
