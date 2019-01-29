#!/bin/sh

######
## New blog post creator, with pre-populated frontmatter
## I should use gohugo's archetypes instead

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
thumb: ""
year: "$_YEAR"
category: Thoughts
tag:
- 
location: 
---

EOF

gvim "$_FOLDER/$_PERMALINK.md"

