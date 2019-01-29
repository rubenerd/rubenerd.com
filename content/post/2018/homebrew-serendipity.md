---
title: "Homebrew serendipity"
date: "2018-02-16T08:45:31+11:00"
abstract: "Or when you do an update and see weirdly named stuff you don’t recognise"
year: "2018"
category: Software
tag:
- mac
- os-x
- macos
- mac-os-x
- homebrew
- package-managers
location: sydney
---
I always see interesting stuff when updating [Homebrew], much of which I have no idea what it is:

    $ brew update
    ==> Updated Formulae
    ==> allure      frugal   jenkins-lts  paket
    ==> bro         geth     jvgrep       plank  
    ==> chronograf  iperf3   mariadb      suricata
    ==> ffmpeg@2.8  jenkins  mpv          

    
    $ brew info bro
    ==> bro: stable 2.5.3 (bottled), HEAD
    ==> Network security monitor

    
    $ brew info suricata
    suricata: stable 4.0.4 (bottled)
    Network IDS, IPS, and security monitoring engine

Whoa, by sheer chance I picked two that were network security monitors.

[Homebrew]: https://brew.sh

