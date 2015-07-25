#!/bin/sh

######
## Script to generate new podcast episode file
##
## 2015-07-26: Added Onsug date, fixed hugo frontmatter date
## 2015-06-12: Created

set -e

_archive="content/post/show/"  ## Where show files are located
_template="drafts/show.html"   ## Template to generate new show files
_time_fmt="%H:%M:%S%z"         ## Time format for Hugo frontmatter
_date_fmt="%Y-%m-%d"           ## Date format for Hugo frontmatter
_onsug_date_fmt="%B %Y"        ## For "Released July 2015 on Onsug" date 
_editor="mvim"                 ## Editor to launch after

## Get latest episode file and number
_last_episode=`ls -1 ${_archive} | tail -n1 | sed 's/show//' | sed 's/\.html//'`
_new_number=`expr ${_last_episode} + 1`
_new_episode="${_archive}show${_new_number}.html"

## Create new episode file using template
cp -f ${_template} ${_new_episode}

## Get current date with required Hugo formatting
_time=`date +"${_time_fmt}" | sed -e 's/00$/:00/'`
_date=`date +"${_date_fmt}"`
_onsug_date=`date +"${_onsug_date_fmt}"`

## Replace episode number
sed -i '' "s/SHOWNUM/${_new_number}/g" ${_new_episode}

## Replace dates
sed -i '' "s/^date.*/date: \"${_date}T${_time}\"/" ${_new_episode}
sed -i '' "s/ONSUGDATE/${_onsug_date}/" ${_new_episode}

## Replace title
sed -i '' "s/^title.*/title: \"Rubénerd Show ${_new_number} ${_date}\"/" \
    ${_new_episode}

echo "New episode ${_new_number} created, opening editor..."
`${_editor} ${_new_episode}` &

exit

## EOF
