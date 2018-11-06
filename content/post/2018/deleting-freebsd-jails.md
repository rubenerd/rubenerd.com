---
title: "Deleting all FreeBSD jails"
date: "2018-10-22T16:12:23+11:00"
abstract: "chflags -R noschg /usr/jails && rm -rf /usr/jails"
year: "2018"
location: Sydney
category: Software
tag:
- freebsd
- jails
---
There are tons of guides online for creating jails, and an always excellent page in the [handbook], but precious few instructions for deleting them.

Assuming you used ezjail with default settings, you can blow them all away with this:

    # echo "WARNING, THIS WILL DELETE ALL OF THEM!"
    # chflags -R noschg /usr/jails
    # rm -rf /usr/jails

Then you can start over again; as opposed to just starting again, or starting over. I remember `noschg` by thinking of Benedict Reuschling :).

Wait, I don't think I've ever posted about *using* jails here, or ezjail, or even iocage. Making a mental and physical note to correct this.

[handbook]: https://www.freebsd.org/doc/handbook/jails-ezjail.html

