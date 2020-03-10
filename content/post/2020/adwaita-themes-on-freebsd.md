---
title: "Adwaita themes in FreeBSD"
date: "2020-03-02T08:37:20+11:00"
abstract: "Use the gnome-themes-standard package"
thumb: ""
year: "2020"
category: Software
tag:
- design
- gnome
- gtk
- themes
- xfce
location: Sydney
---
Last week I was trying to find the Adwaita GTK theme for my FreeBSD tower. I used to love tinkering with themes, but thesedays I just want one that looks decent across multiple toolkits, and Adwaita fits the bill.

*(Curiously, Xfce's Appearance pane used to list it as an option, but not as of FreeBSD 12.x. I used to like Bluebird back in the day, but I find Greybird a bit dreary and low contrast).*

Finding it in the ports system proved trickier than I expected. If you search for Adwaita you get the [iconset](https://www.freshports.org/x11-themes/adwaita-icon-theme/) and [Qt theme](https://www.freshports.org/x11-themes/adwaita-qt/), but not the GTK2/3 themes. Fortunately [Oliverd@ had this suggestion](https://people.freebsd.org/~olivierd/xfce-faq.html) on his Xfce FAQ:

> **How can unified themes be used with GTK3 and GTK2?**
> 
> Install `x11-themes/gnome-themes-standard`, and change the value of `/Net/ThemeName` property

This is now [gnome-themes-extra](https://www.freshports.org/x11-themes/gnome-themes-extra/) instead. Install that, and Adwaita appears as a GTK theme option.

