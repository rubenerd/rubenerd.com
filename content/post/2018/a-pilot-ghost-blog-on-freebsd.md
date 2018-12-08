---
title: "A pilot Ghost install on FreeBSD"
date: "2018-12-08T20:05:56+11:00"
abstract: ""
thumb: ""
year: "2018"
location: Sydney
category: Thoughts
tag:
- 
---
I thought I'd try [Ghost] this weekend for some side projects, and for Clara's reimagined blog. Ghost was started by a former WordPress UI engineer who wanted to return to the basics of blogging. And their non-profit organisation is based out of Singapore, *wah so good is it!* 🇸🇬

There are dozens of tutorials for setting up Ghost on [FreeBSD] with ZFS pool-backed jails, ipw, and other niceties, but no quick and dirty pilot guide for evaluating Ghost. This post has been written to serve this need, though bare in mind *this is not for production!* 


### Downloading packages

These are the packages you need. I use node8 and Percona over MariaDB because they most closely match Ghost's system requirements:

    # pkg install nginx-devel node8 npm-node8 percona57-server


### Installing the database

Get the generated root password and log in:

    # cat /root/.mysql_secret
    # mysql -u root -p

Set a new root password, and create a database and user:

    > SET PASSWORD=PASSWORD('password');
    > CREATE DATABASE ghost_staging;
    > CREATE USER 'ghost_user'@'%' IDENTIFIED BY 'password';
    > GRANT ALL PRIVILEGES ON ghost_staging.* TO 'ghost_user'@'%';  
    > FLUSH PRIVILEGES;


### Prepare nginx

I use nginx to reverse-proxy Ghost. In the spirit of a pilot, add the following in the `server {}` declaration of `nginx.conf`. Ghost usually defaults to port 2368; if not, change it here when you're troubleshooting.

    location / { 
        ## Add this when you install your certs
        ## proxy_set_header  X-Forwarded-Proto https;
        proxy_set_header  X-Real-IP $remote_addr;
        proxy_set_header  Host $http_host;
        proxy_pass        http://127.0.0.1:2368;
    }


### Create target folder and user

Create a new user, then a target folder for Ghost, and set ownership:

    # adduser
    [..]
    # mkdir -p /var/www/ghost
    # chown ghost /var/www/ghost


### Install Ghost

This is where the fun starts. Install the ghost-cli: 

    # npm install --global ghost-cli

Then go to your install folder and install:

    # cd /var/www/ghost
    # ghost install

Ghost was written for Linux, so it will fail to detect MySQL, and won't do its autoconfiguration. When prompted to `continue anyway?`, just hit `y`.

When you reach the MySQL configuration, use the creds you generated above:

    ? Enter your blog URL: http://<server IP>
    ? Enter your MySQL hostname: localhost
    ? Enter your MySQL username: ghost_user
    ? Enter your MySQL password: <your password>
    ? Enter your Ghost database name: ghost_staging

Press `n` when prompted to create a `ghost` MySQL user, for nginx, and for systemd, because FreeBSD uses an init system that isn't awful.

Assuming all has gone well, go to the IP of your server in Firefox, and you'll have Ghost. *Boom!*


### Where to from here

If you like Ghost and want to use in prod, I'd advise using on Ubuntu. It's the officially supported OS for the software, and you'll likely have fewer troubles. If you decide to go ahead on FreeBSD:

* Create rc.d scripts, so you can start your Ghost install on boot. The links below have some examples.

* Create jails for your database, and Ghost install(s). I still love `ezjail`, but you have a few options now.

* Lock down your database to only accept connections from your jail, delete test accounts, etc. `mysql_secure_installation` is a solid start.

* Create an ipw firewall. I learned at AsiaBSDCon that its still preferred over pf for performance reasons on FreeBSD.

* Use Let's Encrypt's `py-certbot` and `py-certbot-nginx` to generate certificates, or import your own, so at minimum you're accessing your admin portal over TLS.

These guides were surpremly useful:

* [Installing Ghost on FreeBSD 11.1, by I Don't Watch TV](https://idontwatch.tv/installing-ghost-on-freebsd-11-1/)
* [How to Install Ghost with Nginx on FreeBSD 10.2, by LinOxide](https://linoxide.com/linux-how-to/install-ghost-nginx-freebsd-10-2/)
* [Deploying Ghost on FreeBSD, by Absurd Tech](https://absurd.tech/ghost-on-freebsd/)

[py-certbot]: https://www.freshports.org/security/py-certbot/
[py-certbot-nginx]: https://www.freshports.org/security/py-certbot-nginx/
[Ghost]: https://ghost.org/
[FreeBSD]: https://www.freebsd.org/
