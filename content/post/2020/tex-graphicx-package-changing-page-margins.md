---
title: "TeX graphicx changing page margins"
date: "2020-02-10T12:13:02+11:00"
abstract: "Import your paper geometry after to fix"
year: "2020"
category: Software
tag:
- documentation
- latex
- tex
- troubleshooting
- writing
location: Sydney
---
[graphicx](https://ctan.org/pkg/graphicx) is the *de facto* standard for including images in (La)TeX documents. But I noticed on the weekend that importing the package resulted in the margins in the document shifting:

    \documentclass[12pt]{memoir}
    \usepackage[b5paper]{geometry}
    \usepackage{graphicx}

I'd been using this for years, so the behavior surprised me. I swapped the document type back to `book`, and changed my beloved `b5paper` size to `a4paper` without any difference. I thought maybe some images were stretching the margins somewhere, but removing the aforementioned visual depictions them also did nothing.

Importing the paper geometry *after* `graphicx` fixed it:

    \documentclass[12pt]{memoir}
    \usepackage{graphicx}
    \usepackage[b5paper]{geometry}

Or defining it in your `documentclass` if it's supported:

    \documentclass[12pt,b5paper]{memoir}
    \usepackage{graphicx}

I love writing in LaTeX, but I always forget small things like this.

