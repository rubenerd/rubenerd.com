---
title: "When junk blogs stifle troubleshooting"
date: "2020-02-18T10:08:07+11:00"
abstract: "Can’t boot your computer? Well, first boot your computer, then..."
year: "2020"
category: Software
tag:
- troubleshooting
- weblog
- windows
location: Sydney
---
There's a particular type of junk blog out there that regurgitates posts from other blogs without any original research. They're not as blatant as those that merely scrape RSS feeds and republish, but they still lift entire posts wholesale and only make token efforts to change the content. I've seen blogs even use the same screenshots, right down to the same mis-cropped window or blatant watermark, albeit with a few more JPEG artefacts from several steps of lossy compression along the way. This is unfortunately easy to do with instructional material, as the steps involved in configuring something will necessarily follow a predictable set of steps.

Plagiarism is obviously unethical, but almost as irritating is getting the same repurposed results when you're trying to solve a problem. If it didn't help the first time, having it appear another dozen times is a recipe for losing hair.

As an example, it's been a while since I've had to boot Windows Server in safe mode. So I was looking online about how to do it. The first pages of search results are showed the exact same three steps:

1. Using `msconfig` after Windows has booted
2. Using Windows Settings after Windows has booted
3. Using `bcdedit` after Windows has booted

See anything wrong with these? If you're attempting to boot in safe mode, it's almost certainly because the **damn thing won't boot**. Being told once to change a tyre while your car is running is strange. Being told ten times is bananas.

I'm tempted to create a blocklist to feed to uBlock Origin or ABP to filter out these sites.

