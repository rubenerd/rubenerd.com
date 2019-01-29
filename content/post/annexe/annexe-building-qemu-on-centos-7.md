---
title: "Building QEMU on CentOS 7"
date: "2017-05-12T17:53:15+11:00"
abstract: "This originally appeared on the Annexe."
year: "2017"
category: Annexe
tag:
- centos
- qemu
- virtualisation
location: sydney
---
*This originally appeared on the Annexe.*

Download dependencies:

	yum groupinstall "Development Tools"
	yum install zlib-devel
	yum install gtk2-devel

Then install from the latest source tarball:

	./configure --enable-tools \ 
        --disable-system       \
        --disable-user         \
        --disable-linux-user   \
        --disable-bsd-user 

