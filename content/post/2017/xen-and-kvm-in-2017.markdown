---
draft: true
title: "Xen and KVM in 2017"
date: "2017-09-14T10:14:21+10:00"
year: "2017"
location: Sydney
abstract: ""
year: "2017"
location: Sydney
category: Thoughts
tag:
- 
---
It's been interesting watching the classic Vi/Emacs-style battle between Xen and KVM, particularly in the last few years. Tech analysts and journalists were predicting a swing towards KVM; not surprising given the push from Red Hat and OpenStack.

Take this article written by William von Hagen for IBM DeveloperWorks in 2014:

> Several reasons exist for the ascendancy of KVM over Xen as the open source bare-metal virtualization technology of choice for most enterprise environments.

That ascendency that seemed all but assured in 2014 hasn't been borne out. 

The world's largest IaaS clouds, Azure notwithstanding, still run Xen, and are expanding faster than other clouds. By contrast, the largest KVM and KVM-powered OpenStack clouds [have been closing up]\:

> Cisco has joined the companies ditching their clouds ... This follows from Nebula shutting down their OpenStack hardware business, and the then-HP closing their Helion Public Cloud in 2015. Last month, HPE sold their OpenStack cloud ... Rackspace famously demoted their OpenStack deployment and became an Amazon partner

There are several reasons for this. Personally, I can speak to OpenStack's technical complexity and piecemeal architecture; this [StackExchange answer being typical]. But that's almost incidental, more critical are simple market forces that OpenStack hasn't been able to counter.

The story is a little different in private clouds where OpenStack is still making inroads against the likes of VMware. On that case though, it's more on cost I've witnessed, not technical advantages. And in that area, Xen still has KVM beat in performance.

As William wrote:

> Although Xen can still offer higher-performance bare-metal virtualization than KVM, the value of those performance improvements is often outweighed by the simplicity and ease of use of KVM virtualization.

KVM is arguably simpler initially, but the hypervisor is a far smaller part of a complete cloud. Storage and networking introduce far more complexity and wiggle room than any usability difference between KVM and Xen.

[have been closing up]: https://rubenerd.com/more-closed-and-sold-clouds/
[StackExchange answer being typical]: https://rubenerd.com/rocky-openstack/

