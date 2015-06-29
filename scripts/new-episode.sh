#!/bin/sh

######
## Script to generate new podcast episode file
## Uses previous episode as template
## It should use a Hugo archetype; and we should also exercise more 
## Created 2015-06-12

set -e

_archive="content/post/show/"
_time_fmt="%H:%M:%S%z"
_date_fmt="%Y-%m-%d"
_editor="mvim"

## Get latest episode file and number
_previous_episode=`ls -1 ${_archive} | tail -n 1`
_previous_number=`echo ${_previous_episode} | sed 's/\.html//' | sed 's/show//'`
_new_number=`expr ${_previous_number} + 1`
_new_episode="show${_new_number}.html"

## Create new episode file, using previous show as template
cp -f ${_archive}${_previous_episode} ${_archive}${_new_episode}
#cp -f ${_previous_episode} ${_new_episode}

## Get current date with Hugo formatting
_time=`date +"${_time_fmt}"`
_date=`date +"${_date_fmt}"`

## Replace episode number
sed -i '' -e "s/${_previous_number}/${_new_number}/g" \
    ${_archive}${_new_episode}

## Replace date
sed -i '' -e "s/^date.*/date: \"${_date}T${_time}\"/" \
    ${_archive}${_new_episode}

## Replace title
sed -i '' -e "s/^title.*/title: \"Rubénerd ${_new_number} ${_date}\"/" \
    ${_archive}${_new_episode}

echo "New episode ${_new_number} created, opening editor..."
`${_editor} ${_archive}${_new_episode}` &

exit

## EOF

