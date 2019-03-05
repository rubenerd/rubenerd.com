---
title: "Learning about shell indirect expansion"
date: "2019-03-03T15:18:52+11:00"
abstract: "Dereferencing variables in bash and sh via an eval hack."
year: "2019"
category: Software
tag:
- bash
- bashisms
- bsd
- freebsd
- netbsd
- shell-scripting
- scripting
location: Sydney
---
I learned something about shell scripts this weekend that until now I only thought was possible with dereferencing and pointers in language like C and Perl. In short, they let you pull the value of a named variable from another.

It's easier to explain with an example. Say you have a series of interface shell variables, and a count:

    IFACE1="x.x.x.x/24"
    IFACE2="x.x.x.x/23"
    IFACE3="x.x.x.x/32"
    IFACES="3"

Ideally you'd just write a shell loop to get each of these, but that just prints the variable name.

    for I in $(seq 1 $IFACES); do
        echo "IFACE${I}"
    done
        
    ==> IFACE1
    ==> IFACE2
    ==> IFACE3

In bash you can dereference these using indirect expansion. Note the exclamation mark syntax:

    CONFIG="IFACE1"  
    echo ${!CONFIG}
    ==> x.x.x.x/24

Now you can iterate over these list of shell variables in your if statement, and get what you need.

This works, but it's [bash specific], as I discovered this weekend while removing bashisms from OrionVM's FreeBSD and NetBSD templates. The good news is you can achieve the same result using `eval`:

    CONFIG="IFACE1"
    eval echo \$$KEY 
    ==> x.x.x.x/24 

I wonder if you could do something less hacky in ksh, which both these BSDs have?

[bash specific]: https://www.gnu.org/software/bash/manual/html_node/Major-Differences-From-The-Bourne-Shell.html "GNU: Appendix B Major Differences From The Bourne Shell"
