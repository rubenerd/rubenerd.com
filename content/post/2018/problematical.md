---
title: "WordNet and Problematical"
date: "2018-11-04T12:51:24+11:00"
abstract: "I didn’t know that was a word."
year: "2018"
category: Media
tag:
- bsd
- freebsd
- language
- podcasts
- written-in-sydney
---
A few technical podcasters I listen to keep using the term *problematical*.
I didn't think it was a word, but according to WordNet:

> Overview of adj problematical
> 
> The adj problematical has 2 senses (no senses from tagged texts)
> 
> 1. debatable, problematic, problematical -- (open to doubt or debate; "If you ever get married, which seems to be extremely problematic")
> 
> 2. baffling, elusive, knotty, problematic, problematical, tough -- (making great mental demands; hard to comprehend or solve or believe; "a baffling problem"; "I faced the knotty problem of what to have for breakfast"; "a problematic situation at home")

I'll stick to *problematic*, but there you go.

Also, you owe it to yourself to install [textproc/wordnet], or WordNet from [homebrew]. Then you can get a definition overview with:

    $ wn problematical -over

Or the "`-sensa`" option, which returned the following synonyms:

> Sense 1  
> debatable, problematic, problematical  
>     => questionable (vs. unquestionable)

> Sense 2  
> baffling, elusive, knotty, problematic, problematical, tough  
>     => difficult (vs. easy), hard  

[textproc/wordnet]: https://www.freshports.org/textproc/wordnet/
[homebrew]: https://formulae.brew.sh/formula/wordnet

