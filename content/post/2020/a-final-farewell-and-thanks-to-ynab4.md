---
title: "A final farewell and thanks to YNAB4"
date: "2020-02-27T18:10:49+11:00"
abstract: "This week we moved entirely back to spreadsheets after half a decade."
thumb: "https://rubenerd.com/files/2020/screenie-ynab@2x.png"
year: "2020"
category: Software
tag:
- budgeting
- finance
- home
- ynab
location: Sydney
---
I [discussed last month](https://rubenerd.com/the-envelope-method-and-ynab4/) the virtual envelope system of budgeting, and that *You Need a Budget* (YNAB) was the best software for implementing it. Unfortunately for our use case, this was long replaced by a subscription web service, and YNAB4 became abandonware.

There are so many other competing tools you can use, but deep down I didn't want to be locked into another vendor's design decisions and file formats again. So I finished the post by setting a target for myself:

> My end goal is to replace this [third-party updated YNAB] entirely with a reworked spreadsheet I’ve half-moved over to for a while...

Over the last month we finally did it, and this week I reached a milestone where I budgeted in the spreadsheet instead of YNAB for everything, for the first time in half a decade. Hitting `⌘Q` after confirming all our data had been successfully exported felt like the end of an era.

<p><img src="https://rubenerd.com/files/2020/screenie-ynab@2x.png" alt="Screenshot from YNAB showing the Quit YNAB menu item" style="width:500px; height:250px;" /></p>

The spreadsheets consist of a relatively simple AutoFilter'd chequebook sheet with each expense classified by account and envelope, and a budget sheet with a series of `SUMIFS()` to allocate and track spending in each envelope per month. We've also added features we'd always wanted, such as basic burn-down charts for each envelope using data bars, and basic multi-currency support.

Saying it's functionally-equivalent to YNAB would be more of a stretch than the lyrca I see some people wear at the gym, but for our needs it's perfect.

*(The earliest versions used `SUMPRODUCT()`, but I was able to refactor them out for noticably better performance. I am by no means a spreadsheet expert, but I'd say its flexibility and elegant syntax is easily outweighed by its sluggishness; at least under the limited circumstances I've used it).*

Thanks to Jesse and the YNAB team for introducing us to this system, and instilling in us the discipline to carefully plan for and track everything: it's *absurd* what a difference it's made. As I wrote in that first post:

> Tracking each cent might seem tedious, but I reconcile my accounts each weekend over coffee and derive a tremendous amount of relief knowing that I have an exact picture of my finances. It also makes tax time, investing, and budgeting for large expenses ludicrously easy and stress free. It’s not that I have time for it, as much as I don’t have time *not* to do it.

