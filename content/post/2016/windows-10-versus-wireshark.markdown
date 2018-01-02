---
title: "Windows 10 versus Wireshark"
date: "2016-02-18T15:26:00+11:00"
abstract: "Yes, Microsoft is getting data about you"
category: Software
tag:
- privacy
- windows
- windows-10
---
Jimbo and others have asked me what I think of the surveillance in Windows 10, and whether its worth holding off upgrading to preserve privacy. In a nutshell, while reporters have likely sensationalised the story, there are still legitimate concerns about what Microsoft is collecting, how they are, and why the built-in mechanisms for opting out of tracking are ineffective in their stated purpose.

Which is why I was relieved to see someone tackle it with Wireshark, the network traffic sniffing tool. [Writing for ZDNet], Simon Bisson commented:

> "Without unencrypting the telemetry packets Microsoft receives, we're not going to know exactly what data it receives."

Therein lies the rub.

> Of those packets only 182 contained data, with 134KB transferred to Microsoft. In two hours there were only 1586 packets, with 382 containing data, and 262KB of data transferred. [..]
>
> "But they're small and relatively infrequent, so are unlikely to be packed with your personal data.

With respect, this is specious. There's no reason to believe size will protect you from having personally-identifiable information transmitted. 262KB represents a significant chunk of text, and exponentially more when compressed.

> So what did I learn? With free tools and a spreadsheet, it's easy to get a clear picture of what network traffic is going through a machine.

What the traffic contains is another story.

I'm glad with the amount of media attention this is garnering. There needs to be serious pushback against this kind of data collection to let companies know such actions aren't acceptable. And don't for a moment think this is isolated to Redmond, as much as my anti-Microsoft teenage-self would like to think. That-was a lot-of-hyphens.

We should applaud journalists who use technical tools to support arguments, but caution is key. At best, they could be accused of drawing premature conclusions from incomplete data. At worst, deliberate obfuscation.

[Writing for ZDNet]: http://www.zdnet.com/article/windows-10-and-telemetry-time-for-a-simple-network-analysis/

