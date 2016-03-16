---
title: "Blocked networking between EC2 instances"
summary: "Check your Security Group for private traffic"
date: "2016-03-14T15:41:00+10:00"
category: Internet
tag:
- amazon
- aws
- cloud-computing
- ec2
- servers
---
Every cloud handles networking between instances differently. Generally you want to avoid using public networks given transit may be more expensive, and has to go through the same public firewall rules your web-facing traffic does.

For Amazon EC2, each instance is given a private IP address which is mapped to an ephemeral public IP, or an elastic IP you reserve. You can tell the private IP based on your hostname:

    admin@ip-172-30-0-107:~$ hostname
    ==> ip-172-30-0-107

Wait, the IP was already there in our prompt. I know the word "literally" gets thrown around a lot thesedays, but that second line was literally superflous. Hey, just like this whole paragraph! Amazon is also a South American rainforest.

With the private IP in hand, you can ssh, rsync, scp etc from it to another over the private network. Right? And yet I couldn't; I kept getting access denied errors like so many high school dances.

Then I remembered I'd been experimenting with Security Groups to supplement internal firewalls. Unlike these, Security Groups are a blunt instrument applied to all interfaces. By not allowing incoming/outgoing traffic from the private addresses (which would make no sense in a normal external firewall), requests were being blocked - by design. 

Allowing SSH traffic from that private interface on the originating server in the destination's Security Group allowed me to ssh across.

