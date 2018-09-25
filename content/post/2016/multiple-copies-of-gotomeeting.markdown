---
title: "Multiple GoToMeeting versions"
date: "2016-09-26T09:13:17+10:00"
year: "2016"
location: Sydney
category: Software
tag:
- mac
- macos
- mac-os-x
- os-x
- gotomeeting
---
I like to keep a pretty tight ship as far as software goes. It's why I only begrugingly use Microsoft and Adobe software with their rheems of supporting tools, updaters and other cruft clogging my Applications folder and menubar and other unmentionable places. What?

So I was in for quite the surprise when I found a GoToMeeting folder alongside the application:


    $ ls -ld /Applications/GoToMeeting*
    ==> [..] Sep 19 15:42 /Applications/GoToMeeting/
    ==> [..] Sep  5 15:35 /Applications/GoToMeeting.app/

Why does it need another folder? Not to get all Malcolm Gladwell on you, but *turns out* the tool is keeping multiple copies of itself:

    $ ls -lt /Applications/GoToMeeting
    ==> [..] Sep 19 15:42 GoToMeeting (5573).app/
    ==> [..] Sep  5 15:35 GoToMeeting (5530).app/
    ==> [..] Aug 31 13:53 GoToMeeting (5506).app/
    ==> [..] Aug 18 13:54 GoToMeeting (4962).app/
    ==> [..] Aug 11 13:38 GoToMeeting (5387).app/
    ==> [..] Jul  4 12:49 GoToMeeting (5174).app/

I asked around the office, and some poor saps had more than twenty entries in here, some of them dating back almost a year.

According to [Citrix's knowledge base]:

> In order to join a meeting, you must have the same version of GoToMeeting installed as the Organizer (host). We recommend enabling auto-updates to ensure that you are always running a compatible version of GoToMeeting.

I didn't enable auto-updates, though I assume its the default now. I just click the link whenever people invite me to the meeting.

> GoToMeeting will download the most-recently-released versions automatically, so you don't have to wait to install a new version when you join a meeting. [..] Versions older than 90 days will be removed automatically

That doesn't seem to jive with experiences elsewhere in the office, but 4th of July does fall within 90 days for me. Mystery mostly solved.

[Citrix knowledge base]: https://support.citrixonline.com/en_US/meeting/knowledge_articles/000185085?title=Multiple+Versions+of+GoToMeeting+Installed+on+Ma
