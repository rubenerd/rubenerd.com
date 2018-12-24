---
title: "Train Simulator 2019 on Linux"
date: "2018-10-21T00:39:48+11:00"
abstract: "It works on Steam Play!"
thumb: "https://rubenerd.com/files/2018/trainsim2019-flyingscotsman@1x.jpg"
year: "2018"
category: Software
tag:
- games
- linux
- steam
- trains
- written-in-sydney
---
Valve announced a [new version of Steam Play] back in August, with a newer Proton engine and substantial work done to Wine:

> … we've continued to look for ways to make more titles easily accessible to Linux users. … So, two years ago, we started an effort to improve the quality and performance of Windows compatibility solutions for Steam games.
>
> As a result of this work, today we are releasing the Beta of a new and improved version of Steam Play to all Linux users! It includes a modified distribution of Wine, called Proton, to provide compatibility with Windows game titles.

This was huge news. Games are about the last reason many of us begrugingly kept Windows around. So naturally, the first question that came to all of our minds: can it run Dovetail's *[Train Simulator 2019]*? Short answer, yes!

### Trying Train Simulator

Here we have everyone's favourite steam locomotive in one of the many yards of Marias Pass. I can't get enough of that LNER reflective apple green paint.

<p><img src="https://rubenerd.com/files/2018/trainsim2019-flyingscotsman@1x.jpg" srcset="https://rubenerd.com/files/2018/trainsim2019-flyingscotsman@1x.jpg 1x, https://rubenerd.com/files/2018/trainsim2019-flyingscotsman@2x.jpg 2x" alt="" style="width:500px; height:281px;" /></p>

And the inside of a JNR 105 Series on the Wakayama-Sakurai Line:

<p><img src="https://rubenerd.com/files/2018/trainsim2019-jnr105@1x.jpg" srcset="https://rubenerd.com/files/2018/trainsim2019-jnr105@1x.jpg 1x, https://rubenerd.com/files/2018/trainsim2019-jnr105@2x.jpg 2x" alt="" style="width:500px; height:281px;" /></p>


### Preparing the target machine

My testing setup is a fresh install of Ubuntu 18.10 on my budget gaming rig. If you also have an Nvidia card, grab the most [recent drivers]\:

    # add-apt-repository ppa:graphics-drivers
    # apt-get update
    # apt-cache search nvidia-drivers
    # apt-get install nvidia-driver-396

Then install Steam for Linux:

    # apt-get install steam-installer

Starting this will bootstrap Steam. Once installed, you'll need to enable Steam Play for all games:

1. Open Steam, and click the *Steam* menu.
2. Click *Settings*.
3. Click *Steam Play* in the sidebar.
4. Confirm *Enable Steam Play for supported titles* is checked.
5. Under *Advanced*, check *Enable Steam Play for all titles.*

At the time of writing, the *Compatibility tool* could just be left at *Proton 3.7-8*, though it may be worth trying a new stable one if it exists from the dropdown.


### Installing the game

*Train Simulator 2019* almost works out of the box, though with some visual issues with bodies of water. The only roadblock is asset files need to be extracted, or the game will fail to load them.

Following [Goliathfan's excellent guide], you can extract as per below. My Steam install was in a slightly different place by default, so:

    $ find ~/.steam/steam/steamapps/common/RailWorks/ \
        -name "*.ap" -execdir unzip '{}' ';'

I got a bunch of errors when first launching the game and trying a Quick Drive scenario. Quitting the game, running the above again, then starting again seemed to resolve it. Maybe the first launch fetched more assets.

I haven't tried the 64-bit version yet.


### There you have it

Now we just need this on FreeBSD, so I can pull out of Philadelphia on my Acela Express in style.

<p><img src="https://rubenerd.com/files/2018/trainsim2019-philly@1x.jpg" srcset="https://rubenerd.com/files/2018/trainsim2019-philly@1x.jpg 1x, https://rubenerd.com/files/2018/trainsim2019-philly@2x.jpg 2x" alt="" style="width:500px; height:281px;" /></p>

[new version of Steam Play]: https://steamcommunity.com/games/221410/announcements/detail/1696055855739350561
[recent drivers]: https://help.ubuntu.com/community/BinaryDriverHowto/Nvidia
[Goliathfan's excellent guide]: https://steamcommunity.com/app/24010/discussions/3/1736588252411243051/
[Train Simulator 2019]: https://dovetailgames.com/products/

