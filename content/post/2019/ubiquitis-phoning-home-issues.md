---
title: "Ubiquiti’s phoning home issues"
date: "2019-11-10T14:25:35+11:00"
abstract: "There will be an opt-out, but it’s a tired old story with a new vendor."
year: "2019"
category: Internet
tag:
- networking
- privacy
- wifi
location: Sydney
---
Clara and I rent, so I'm happy laying cat-6 cables under skirting boards and behind furniture piping back to a nice pfSense VM router running on a bhyve server, with a separate Wi-Fi hotspot and an NBN modem in bridge mode. And therein lies the sum of my networking knowledge.

But friends and clients who *do* know what they talk about praise Ubiquiti gear for it's performance, privacy, and configurability. [Unfortunately](https://community.ui.com/questions/UI-official-urgent-please-answer/14259289-e4c3-4c5e-aaa0-02a5baa6cbbe?page=2)\:

> Here's a thread from 10 days ago asking about the phone-home by APs to trace.svc.ui.com, introduced in a recent firmware release. I've seen this question asked in multiple places on the forum but with no response from any UI employee.
> 
> The situation is very simple. Either you intentionally added a phone-home, in which case you need to tell us and give us an option to disable it. Or this was unintentional, and you need to release a firmware update without this behavior. But ignoring these questions is totally unacceptable.

Ubiquiti responded:

> Hi all- posted an official update here with a detailed explanation, also want to confirm that we are adding an opt-out feature in upcoming versions

It's a welcome start, not least for their reputational damage and potential GDPR issues. But their formal explanation still leaves open questions.

This goes beyond just Ubiquiti, and I feel like we're flogging a dead horse by now, but vendors need to understand it's not just the act of phoning home, or changing licences, or breaking features, or whatever; it's the attempt to do it on the sly or without consent. *Doubly so* when we're talking about fundamental network infrastructure, or core operating systems.

Apologies and fixes are always welcome, but they ring hollow when they routinely explain the former, and ignore the latter. Get enough of these at an industry scale, and you can see why engineers are becoming (more) cynical. In part because we all know another company will do this again, with the same contrition and learned lessons.

This touches on *so many things*, but the broader issue here remains that as long as there are incentives to be sneaky, product managers will try it.

