#!/bin/sh

######
## New blog post creator, with pre-populated frontmatter
## I should use gohugo's archetypes instead, or a jinja2 template

_PERMALINK=$1
_DATE=`date "+%FT%H:%M:%S%:z"`
_YEAR=`date "+%Y"`
_FOLDER="./content/post/$_YEAR"

## Create content year folder if doesn't exist
[ ! -d "$_FOLDER" ] && mkdir "$_FOLDER"

## Take a stab at writing the title
_TITLE=$( echo $_PERMALINK | tr '-' ' ' )

## Template for new post
tee -a "$_FOLDER/$_PERMALINK.md" << EOF
---
title: "$_TITLE"
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

