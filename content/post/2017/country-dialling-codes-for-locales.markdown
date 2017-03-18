---
draft: true
title: "Country dialling codes for locales"
date: "2017-03-08T16:26:00+10:00"
abstract: "I love when disparate data sets corrolate!"
category: Software
tag:
- australia
- dos
- freedos
- nostalgia
- retro
- singapore
---
I love when disparate data sets corrolate. Check out this example from the FreeDOS [country.sys] documentation:

> COUNTRY enables/sets international features of DOS by selecting a
  country code and (only with the unstable / devel kernel) optionally
  also a codepage and country file. 

Here are a portion of the standard codes the use:

    Country              Code Codepages
    United States           1 437,850,858
    Canada (French)         2 863,850,858
    [..]
    Malaysia               60 437
    Australia              61 437,850,858
    Singapore              65 437
    Japan                  81 437,932*
    Korea                  82 437,934*

What an awesome use for country dialling codes. They're guarenteed (hashtag asterisk) to be unique and lasting, and can be summarised in three or fewer characters.

For fun I tried 65 for Singapore in MS-DOS 6.20, but alas it didn't work. The Australian code gets closer to the correct format for dates, but it doesn't use leading zeros. Barbarism.

[country.sys]: http://help.fdos.org/en/hhstndrd/base/cntrysys.htm

