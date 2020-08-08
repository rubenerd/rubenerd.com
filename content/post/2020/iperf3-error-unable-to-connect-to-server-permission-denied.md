---
title: "iperf3: error - unable to connect to server: Permission denied"
date: "2020-07-31T21:56:33+10:00"
abstract: "... check your firewall."
year: "2020"
category: Software
tag:
- bsd
- freebsd
- guides
location: Sydney
---
I was running **iperf** between two FreeBSD VMs on OrionVM for some bandwidth benchmarking, like a gentleman. I did this on the server and client:

    server# iperf3 -s
    client# iperf3 -c $SERVER_IP

But I got this:

    iperf3: error - unable to connect to server: Permission denied

Permission denied? Since when did **iperf** include authentication? I couldn't find a single other example of this anywhere. What the flipping dolphin was going on?

Then I remembered the afternoon coffee didn't kick in.

    # service ipfw stop

Yup, the firewall was blocking it. Despite what the error suggests, it had nothing to do with iperf. A better message would have been **service blocked**, but I'm just happy it works now, and nobody ever need know I did something so embarrassing.

*(Note that you'll want to temporarily open a port, rather than taking your whole firewall down. I just did that as a sanity check. But you knew that already, because you're a responsible system administrator).*

