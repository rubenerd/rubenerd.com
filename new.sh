u!/bin/sh

######
## Create a new blog post with pre-defined frontmatter
## I'm sure there's a hugo-ish way to do this.

_PERMALINK=$1
_DATE=`date "+%FT%H:%M:%S%:z"`
_YEAR=`date "+%Y"`
_FOLDER="./content/post/$_YEAR"

[ ! -d "$_FOLDER" ] && mkdir "$_FOLDER"

tee -a "$_FOLDER/$_PERMALINK.md" << EOF
---
draft: true
title: ""
date: "$_DATE"
abstract: ""
year: "$_YEAR"
category:
tag:
- 
---

EOF

gvim "$_FOLDER/$_PERMALINK.md"

