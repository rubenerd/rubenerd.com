---
title: "youtube-dl through a proxy"
abstract: "Or downloading YouTube videos you can’t view in your country"
date: "2016-11-27T11:10:00+10:00"
year: "2016"
location: Sydney
category: Media
tag:
- guides
- ssh
- youtube
---
If you have access to an SSH box in a different region, you can use it as a SOCKS proxy to download YouTube videos with [youtube-dl] you can't view in your own country.

<p style="font-style:italic"><strong>NOTE:</strong> This post does not condone the use of these tools in this way. You perform such actions at your own risk. You're smart enough to know this, but it needs saying anyway.</p>

### The situation

You realised with glee that some [classic true crime shows] are available on YouTube, but when you go to view them, you get:

> This video is not available.
> Sorry about that.

Being sneaky, you try downloading with youtube-dl. Unfortunately, your hopes are dashed when you realise the reason for not being able to view is your region, not a plugin:

    $ youtube-dl https://www.youtube.com/watch?v=w3FZ7t2zUHI
    ==> [youtube] w3FZ7t2zUHI: Downloading webpage
    ==> [youtube] w3FZ7t2zUHI: Downloading video info webpage
    ==> ERROR: w3FZ7t2zUHI: YouTube said: This video is not available.

This cannot stand.  

### Opening the tunnel

Open a socks proxy to your target box. I like defining these in my `~/.ssh/config` file to make things neater:

    host us-tunnel
        # shuttle.name = SOCKS Proxies/🇺🇸
        HostName       <IP ADDRESS>
        User           <USERNAME>
        DynamicForward 23232

Then I can open the proxy as such:

    $ ssh us-tunnel


### Running youtube-dl

There are couple of different ways to do this. One is using the venerable [tsocks] tool which intercepts and forwards TCP connections through a SOCKS proxy. You can use [openroc’s patches] to run it on macOS, then define a tunnel and run youtube-dl through it.

I was about to launch into a discussion of this, but *turns out* youtube-dl now has proxy support! So you can just do this with the above port:

    $ youtube-dl --proxy socks5://localhost:23232/ <YOUTUBE URL>

This post could probably have been condensed into two lines.

[youtube-dl]: https://github.com/rg3/youtube-dl
[classic true crime shows]: https://www.youtube.com/channel/UCU4BHh9Dwfd7-I_xTZ5037Q
[tsocks]: http://tsocks.sourceforge.net/
[openroc’s patches]: https://github.com/openroc/tsocks-macosx

