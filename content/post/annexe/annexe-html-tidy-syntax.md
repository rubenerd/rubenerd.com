---
title: "HTML tidy syntax"
date: "2017-06-14T16:03:00+11:00"
abstract: "This originally appeared on the Annexe."
year: "2017"
category: Annexe
tag:
- html
- xml
location: sydney
---
*This originally appeared on the Annexe.*

Wrapping at column 130, and handle as XML:

    tidy -wrap 130 -quiet -modify -asxml --tidy-mark no $file

