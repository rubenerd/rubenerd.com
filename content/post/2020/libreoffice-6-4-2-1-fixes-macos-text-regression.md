---
title: "LibreOffice 6.4.2.1 fixes macOS text regression"
date: "2020-03-08T09:57:26+11:00"
abstract: "Thanks Christian Lohmaier!"
thumb: "https://rubenerd.com/files/2020/libreoffice-calc.png"
year: "2020"
category: Software
tag:
- apple
- libreoffice
- macos
- spreadsheets
location: Sydney
---
<p><img src="https://rubenerd.com/files/2020/libreoffice-calc.png" alt="LibreOffice Calc icon" style="width:96px; height:128px; float:right; margin:0 0 1em 2em;" /></p>

Last month I sung the praises of LibreOffice but lamented the [sorry state of their Mac port](https://rubenerd.com/libreoffice-is-great-just-not-on-the-mac/). Fonts have never been rendered properly on Retina/HiDPI Macs with it, but the 6.4 branch has such blurry text it was practically unusable.

**I tried the [6.4.2.1 pre-release](https://dev-builds.libreoffice.org/pre-releases/mac/x86_64/) and we have pixellated but clear text again.**

According to [this bug report](https://bugs.documentfoundation.org/show_bug.cgi?id=122218#c181), the issue was resolved by building with Xcode 11 on macOS Mojave. Thanks Christian Lohmaier!

