#!/bin/sh

######
## Script to add latest podcast episode to sidebar
## before Hugo does its thang.
## Created 2015-06-12

set -e

_show_directory="content/post/show/"
_latest_file="layouts/partials/latest.html"
_pre_link='<a style="font-weight:bold" href="http://rubenerd.com/show"'

## Get latest episode
_latest=`ls ${_show_directory} | tail -n 1`

## Get second line, with title
_title=`sed '2q;d' ${_show_directory}${_latest}`

## Get episode number
_episode=`echo ${_title} | awk -F ' ' '{ print $4 }'`

## Get date
_date=`echo ${_title} | awk -F  ' ' '{ print $5 }' | tr -d '"'`

## Print string
_output="${_pre_link}${_episode}/\">Latest Podcast: #${_episode}, ${_date}</a>"
echo ${_output} > ${_latest_file}

## And that's a wrap
echo "      Added show #${_episode} to sidebar successfully"
exit

## EOF

