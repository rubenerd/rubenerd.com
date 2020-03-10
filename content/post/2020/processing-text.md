---
title: "Processing text"
date: "2020-02-12T21:16:28+11:00"
abstract: "Should I use awk for this, or Perl, or a spreadsheet!?"
year: "2020"
category: Software
tag:
- bourne-shell
- databases
- emacss
- perl
- shell-scripting
- sqlite
- text-processing
- xml
- vim
- yaml
location: Sydney
---
An innocuous question from a colleague about what tools I use to process text got me thinking. I don't have a hard and fast rule for when to preference one method over another; mostly it comes down to:

* what type of text I'm dealing with
* where the text is coming from
* the urgency of the results
* whether it needs to be reproduced or shared
* what I feel like doing at the time!

In no particular order, I use these methods:

* **Manual processing**, especially if it's just a few lines or a small file. The law of diminishing returns long taught me that futzing around with a tool can take far longer.

* In a **text editor**, such as Vi(m) or perhaps Emacs in the future. This is especially useful for substitutions, or rearranging large blocks of text, or if the lines don't have a structure you can easily parse or differentiate.

* **Shell scrips** or inline Bourne or OpenBSD oksh, using awk, sed, tr, grep/ag, and pipes. I've been known to write cruddy, once-off XML parsers in them to process data, which you should never do.

* LibreOffice **spreadsheets**. awk is brilliant for processing columns of data, but if you want to do some visual sorting and data selection, sometimes a spreadsheet really is easier. Exporting to csv is also a cinch.

* **SQLite3** databaes. They're cheap to make and import data into, and then you've got standard(ish) SQL queries. I only started doing this recently, but for certain types of data it's very quick.

* **Perl**. I've told myself I need to learn Python or improve Ruby, but Perl hashes are **stupendously useful** and **unreasonably flexible** for mapping data structures and pulling out relevant information. Plus then I get XML, JSON, YAML, TOML, and other parsers for free.

What's less clear is where one tool's domain ends, and another begins. Sets on a Venn diagram would overlap more than not.

