---
title: "How to really add FreeBSD users to groups"
date: "2017-09-23T09:17:59+10:00"
year: "2017"
abstract: "Don’t use the usermod command, or you’ll remove yourself from every other group!"
year: "2017"
category: Software
tag:
- bsd
- freebsd
- guides
---
I've seen [sites listing this] as the way to add a FreeBSD user to a group:

    # echo "DON'T DO THIS"
    # pw usermod [username] -G [groupname]

You almost certainly **don't want to do this**. This command removes you from every group except the one you've listed. This has grave implications if you were a member of wheel before, because now you can't elevate to root.

Instead, you want this:

    # pw groupmod [groupname] -m [username]

[sites listing this]: https://www.cyberciti.biz/faq/freebsd-add-a-user-to-group/

