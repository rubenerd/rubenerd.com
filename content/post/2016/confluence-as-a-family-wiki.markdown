---
title: "Confluence as a family wiki"
date: "2016-08-05T22:55:00+10:00"
year: "2016"
category: Internet
tag:
- atlassian
- confluence
- guides
- postgresql
- wikis
---
Clara and I have been wanting to run a wiki for years to collaborate on projects. We decided to try Atlassian Confluence, mostly because we use it everyday elsewhere and want to keep things simple. I'll also likely be administering it in the future, and wanted to get some experience.

After running it for a few days, we decided it wasn't a good fit for us. If you want to give it a try though, here are some pointers.

### Obligatory (ironic) screenshot

<p><img src="https://rubenerd.com/files/2016/confluence-screenshot.png" srcset="https://rubenerd.com/files/2016/confluence-screenshot.png 1x, https://rubenerd.com/files/2016/confluence-screenshot@2x.png 2x" alt="" style="width:500px" /></p>

### Purchasing

Confluence isn't free, but for up to 10 users its $10. You have to renew each year to get software updates, which to me renders Atlassian's "perpetual licence" claim somewhat disingenuous. They donate it to Room to Read though, and it's cheap, so I was fine with it.

Realistically, you'll want to buy and install a licence if you seriously want to test; the trial database is painfully slow and not a fair indication of how it'll work.

### Installation

Confluence is a Java application running out of Apache Tomcat. On Linux, you download and run the installer which places files in /opt/atlassian and /var/atlassian. If you royally bork your install (as I did once), you can blow away those folders, delete your database tables and start from scratch.

It's claimed the 32 bit version uses less memory for equivalent performance, which makes sense. On x64 Debian Jessie, getting the 32 bit Java working was more trouble than it was worth, so I ran the 64 bit version.

It supports all the major databases, but I used Postgres with a pretty basic table structure:

    postgres=# CREATE USER confluence 
        WITH NOCREATEDB NOCREATEROLE NOSUPERUSER 
        ENCRYPTED PASSWORD 'huge_gibberish_mess';
    postgres=# CREATE DATABASE confluence
        WITH OWNER confluence;
    postgres=# SELECT time 'allballs';

### HTTPS

Confluence wants to run on port 8090. The installer creates a confluence user, which means no low port allocation. It also doesn't install with SSL/TLS enabled. Both of these can be fixed with the wonder of our modern age that is nginx.

There's scant documentation available, and all list snippets of code without telling you exactly where in the hierarchy of XML they're supposed to go! So I've put [my server.xml line up as a Github Gist](https://gist.github.com/rubenerd/f53ff757fabf5376fe86f5c30da1cb48) so you can see **exactly** how to get it working.

Once you've got that, you can create a standard Let's Encrypt-enabled nginx config with the location set to proxy to Tomcat. Here's the config I used, with my letsencrypt.sh keys ready to go:

    server {
        [ usual stuff ]
        [ ssl stuff ]

        location / {
            proxy_set_header X-forwarded-Host $host;
            proxy_set_header X-forwarded-Server $host;
            proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
            proxy_pass http://localhost:8090;
        }
    }

This and the gist assume you want to put your wiki at the root of your domain, another thing there was no documentation anywhere about. If you want to use a subfolder like `/wiki`, change both occurrences of the following in server.xml:

    <Context path="/wiki"

Then change your nginx proxy above to reflect this. And remember, logs/catalina.out is your friend if Confluence doesn't seem to want to start.

### Performance

I won't mince words; even running out of Postgres, Confluence is slow on anything other than a beast. I'm used to administering MediaWiki, Twiki and pmwiki in tiny cloud instances, but even with 4GB of memory it struggled.

There's much to tweak here; you could let nginx handle caching instead of Tomcat; you could tweak Postgres; even run the 32 bit version with less memory. I'm sure in the hands of a competent Atlassian engineer, you could get it working better.

Regardless, this shouldn't be surprising given 4GB of memory barely meets their minimum requirements. For Clara's and my needs, MediaWiki's subset of features suit us just fine, and with a quarter of the memory and load averages that Confluence chewed up even when just starting.

    CPU[|||||||||||||||||||||||||||||||||||||||||||||||||100.0%]     Tasks: 64, 78 thr; 3 running
    Mem[|||||||||||||||||||||||||||||||||||         1720/3942MB]     Load average: 0.33 0.33 0.58
    Swp[                                                  0/0MB]     Uptime: 05:09:19

      PID USER      PRI  NI  VIRT   RES   SHR S CPU% MEM%   TIME+  Command
    20750 confluenc  20   0 3427M 1611M 41548 S 83.6 40.9  4:07.61 /opt/atlassian/confluence/jre//bin/java -Djava.util.logging.config
    20762 confluenc  20   0 3427M 1611M 41548 S 36.7 40.9  1:28.48 /opt/atlassian/confluence/jre//bin/java -Djava.util.logging.config
    21578 confluenc  20   0 3427M 1611M 41548 R 31.0 40.9  0:02.81 /opt/atlassian/confluence/jre//bin/java -Djava.util.logging.config
    20763 confluenc  20   0 3427M 1611M 41548 S  7.1 40.9  0:21.16 /opt/atlassian/confluence/jre//bin/java -Djava.util.logging.config
    [...]

### Conclusions

I'm fortunate to work for an IaaS company that gives me free instances! And I suppose I could run this stack with 16GiB to run this more than capable enterprise wiki. For our personal use though, we've decided to head back to MediaWiki with a vanilla <abbr title="FreeBSD nginx Postgres PHP">FEPP</abbr> stack.

