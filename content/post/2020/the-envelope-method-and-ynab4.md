---
title: "The envelope method, and 64-bit YNAB4 works"
date: "2020-01-17T10:22:26+11:00"
abstract: "You can get YNAB4 running on Catalina after all!"
year: "2020"
category: Software
tag:
- bsd
- finances
- freebsd
- personal
- wine
- ynab
location: Sydney
---
It's hard not to talk about the envelope method of budgeting without sounding like a fanatic, but it's been so [transformative](https://mourner.github.io/bullshit.js/) in how I've managed my finances over the last half decade. I always know where every cent is, and just as importantly, what the job of each cent is.

The strategy for using it is surprisingly simple. Each month, divvy up your total income into virtual envelopes. Some are fixed expenses, such as rent or regular charity donations. Others are more flexible, such as groceries and homelab parts. And others are paying forward, such as savings for a holiday or a BSD conference! If life happens and you need to spend more in a category, you can cover it by lowering it from somewhere else.

Tracking each cent might seem tedious, but I reconcile my accounts each weekend over coffee and derive a tremendous amount of relief knowing that I have an exact picture of my finances. It also makes tax time, investing, and budgeting for large expenses ludicrously easy and stress free. It's not that I have time for it, as much as I don't have time *not* to do it.

<p><img src="https://rubenerd.com/files/2020/icon-ynab@1x.png" srcset="https://rubenerd.com/files/2020/icon-ynab@1x.png 1x, https://rubenerd.com/files/2020/icon-ynab@2x.png 2x" alt="Application icon for YNAB 4" style="width:128px; height:128px; float:right; margin:0 0 1em 2em;" /></p>

You can use a simple spreadsheet for this. But perhaps the most well known tool to do this was *You Need A Budget*. Clara and I first started using this back when it was a desktop application. I recommended the hell out of it back in the day; it was easy to use, and ran beautifully on Windows, Mac, and Wine on FreeBSD. But then two things happened:

* **nYNAB was launched, which is a web service**. The monthly subscription didn't bother me as much as having all my transactions and tax history on a remote server I don't control. Their [security page](https://www.youneedabudget.com/security/) mentions data is encypted at rest, but doesn't say if it's encrypted locally before transmission with my passphrase, or whether it's done at their end. Not mentioning this leads me to suspect it's the latter, which is problematic.

* **macOS Catalina only supports 64-bit applications**, and YNAB doesn't intend to fix their admittedly-deprecated 32-bit desktop application. So modern Macs can't run it.

Which leads me to this [excellent conversion tool](https://gitlab.com/bradleymiller/Y64) by Bradley Miller. It pulls the last desktop application release and replaces the runtime to be 64-bit. Here it is in action:

    > Extracting the 32-bit app from YNAB4_LiveCaptive_4.3.855.dmg
    "disk3" ejected.
    > Extracting the 64-bit Adobe AIR runtime from AdobeAIR.dmg
    "disk3" ejected.
    > Converting the 32-bit app to a native 64-bit app
    ==========================================================
                       _                  _ 
                      | |                | |
                    __| | ___  _ __   ___| |
                   / _  |/ _ \|  _ \ / _ \ |
                  | (_| | (_) | | | |  __/_|
                   \__,_|\___/|_| |_|\___(_)
    ==========================================================
    > The app 'YNAB 4.app' has been saved to:
    > "/var/folders/hk/thebirdisthewordrandom/T/tmp.birdword"
    > Drag the app to your /Applications directory to install
    ==========================================================
    Press [ENTER] to open the folder containing the app
    > Done!

Now YNAB4 runs on Catalina, giving it a new lease on life. Albeit without official support, but it's a moot point considering it was already retired.

My end goal is to replace this entirely with a reworked spreadsheet I've half-moved over to for a while, and eventually to one I've been rewriting in Perl and SQLite3 because why not. But it's a relief that we can keep using the tool in the meantime.

*Some very quick feedback: someone claimed on The Twitters with some juveline insults that I was being hypocritical, given YNAB4 used a third party server in the form of Dropbox for mobile sync. Except, I didn't use that. Whoops, this is awkward! I'll publish their apology just as soon as they get around to writing it, which I'm sure will definitely happen.*

