#!/bin/sh

######
## Script to take the latest podcast episode and add to sidebar
## before Hugo does its thang.
## Created 2015-06-12

set -e

show_directory="content/post/show/"
latest_file="layouts/partials/latest.html"

## Get latest episode
latest=`ls ${show_directory} | tail -n 1`

## Get second line, with title
title=`sed '2q;d' ${show_directory}${latest}`

## Get episode number
episode=`echo ${title} | awk -F ' ' '{ print $4 }'`

## Get date
date=`echo ${title} | awk -F  ' ' '{ print $5 }' | tr -d '"'`

## Print string
output="<a style=\"font-weight:bold\" href=\"http://rubenerd.com/show${episode}/\">Latest Podcast: #${episode}, ${date}</a>"
echo ${output} > ${latest_file}

echo "      Added show #${episode} to sidebar successfully"

## EOF

