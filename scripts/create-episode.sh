#!/bin/sh

######
## Creates, formats and uploads new podcast episodes
## For Rubénerd Show and Snake Tea Podcast
## 
## 2015-07-27: Created

set -e


###########################################################
## Configuration and variables

## Locations to find things
_home="/Users/`whoami`"
_bucket="$_home/Repositories/rubenerd-hugo/bucket"
_episodes="$_home/Repositories/rubenerd-hugo/content/post/show"
_episode_prefix='show'

## Episode details (will be asked for)
_show='Rubénerd Show'
_host='Ruben Schade'
_licence_url='http://creativecommons.org/licenses/by/3.0/'
_licence_title='Creative Commons Attribution 3.0'
_location='Sydney, Australia'
_title='';          ## The something episode!
_number='283';
_description='';

## Internet Archive details
_collection='rubenerdshow'      ## such as "community-audio"
_email='rubenschade@gmail.com'  ## username
_subject='rubenerd'             ## gets added as a tag

## These are automatically generated
_id=''                  ## eg "RubenerdShow218"
_date_time='';          ## for Hugo frontmatter
_date='';               ## for Hugo title
_date_time_utc='';      ## for Internet Archive
_date_utc='';           ## for Internet Archive
_year_utc='';           ## for Internet Archive
_size=0;                ## -> from mp3
_duration='00:00';      ## -> from mp3
_onsug_folder_date=''   ## eg "onsug.com/Jul15/file.mp3"
_onsug_release_date=''  ## eg "Released July 2015 on Onsug.."
_onsug_title_date=''    ## eg "Rubenerd Show 200 (7/12/15)"

## Formats for processing dates
_date_time_fmt='%Y-%m-%dT%H:%M:%S%z';
_date_fmt='%Y-%m-%d';
_year_fmt='%Y';
_onsug_folder_date_fmt='%b%y';
_onsug_release_date_fmt='%B %Y';
_onsug_title_date_fmt='(%-m/%-d/%y)';

###########################################################
## Helper functions

## Print standard string
function say() { 
    printf "%s\n" "$1"
}

## Asks quesion with default answer
## Returns default if no answer provided
function ask() {
    _question=$1
    _default=$2
    read -p "$_question ($_default): " _in
    [ -n "$_in" ] && _default=$_in
    echo $_default
}

## Verifies file exists, and lets user know
function find() {
    _file=$1
    printf "%s" "$1... "
    if [ -f "$1" ]; then
        say "found! ^_^"
    else
        say "not found! ;_;"
        say "Can't continue. Check file and try again."
        exit 1
    fi
}

###########################################################
## Script

## Splash screen!
clear
say "Ruben's and Clara's Podcast Generator 5000!"
say "==========================================="
say ""

## Check dependencies
[ -f "$_home/.netrc" ] && command -v eyeD3 >/dev/null || {
    say "~/.netrc not found, or eyeD3 not installed."
    exit 1
}

## Get curent date and time (time is messy)
_date_time=`date +"$_date_time_fmt" | sed 's/00$/:00/'`
_date=`date +"$_date_fmt"`
_date_time_utc=`date -u +"$_date_time_fmt" | sed 's/00$/:00/'`
_date_utc=`date -u +"$_date_fmt"`
_year_utc=`date -u +"$_year_fmt"`
_onsug_folder_date=`date -u +"$_onsug_folder_date_fmt"`
_onsug_release_date=`date -u +"$_onsug_date_fmt"`
_onsug_title_date=`date -u +"$onsug_title_date_fmt"`

## Ask for details
_show=`ask "Name of the show" "$_show"`
_host=`ask "Host of the show" "$_host"`
_number=`ask "Episode number" "$_number"`
_date_time=`ask "Release date and time" "$_date_time"`
_location=`ask "Location" "$_location"`
_licence_url=`ask "Licence URL" "$_licence_url"`
_licence_title=`ask "Licence URL" "$_licence_title"`
read -p "Episode title (The ... episode!): " _title
read -p "Episode description, in one line: " _description 

## Convert show into id (removing spaces, etc)
_id=`printf "%s" "$_show$_number" | sed 's/ //g' | sed 's/é/e/'`

## Search for source MP3 and cover art files
say ""
say "Will now search for the following assets:"
find "$_bucket/$_id.mp3"
find "$_bucket/$_id.png"

## Copy mp3 for onsug

## eyed3 tags for ia

## eyeD3 tags for onsug 

## Get size of episode


############################################################
## Generate podcast episode for Hugo

cat > "$_episodes/$_id.html" <<EOF
---
title: "$_show $_num"
date: "$_date_time"
summary: "$_title"
enclosure_file: "http://archive.org/download/$_id/$_id.mp3"
enclosure_size: "$_size"
enclosure_duration: "$_duration"
location: "$_location"
category: Show
tag:
- audio-magazine
- new-time-radio
- podcast
- recorded-in-sydney
- the-overnightscape-underground
---
<p class="show-cover"><a href="http://archive.org/download/$_id/$_id.mp3" title="Listen to episode"><img src="http://archive.org/download/$_id/$_id.png" alt="$_show $_number" style="float:left; margin:0px 20px 5px 0px; width:180px; height:180px;" /></p>

<p class="show-summary" style="font-weight:bold">$_title</p>

<p class="show-download">Podcast: <a target="_blank" style="font-weight:bold" href="http://archive.org/download/$_id/$_id.mp3">Play in new window</a> | <a style="font-weight:bold;" href="http://archive.org/download/$_id/$_id.mp3">Download</a></p>

<p class="show-description"><span class="show-duration" style="font-weight:bold">$_duration</span> – $_description</p>

<p class="show-licence">Recorded in $_location. Licence for this track: <a rel="license" href="$_licence_url">$_licence_title</a>. Attribution: $_host.</p>

<p class="show-release">Released $_onsug_release_date on <a href="http://onsug.com/">The Overnightscape Underground</a>, an Internet talk radio channel focusing on a freeform monologue style, with diverse and fascinating hosts.</p>

EOF


###########################################################
## Generate Internet Archive metadata and file manifests

printf "%s" '<files/>' > $_bucket/${_id}_files.xml

cat > $_bucket/${_id}_meta.xml <<EOF
<?xml version="1.0" encoding="UTF-8"?>
<metadata>
  <identifier>$_id</identifier>
  <mediatype>audio</mediatype>
  <collection>$_collection</collection>
  <collection>audio_podcast</collection>
  <title>$_show $_number</title>
  <creator>$_host</creator>
  <date>$_date_utc</date>
  <description>$_description</description>
  <language>eng</language>
  <duration>$_duration</duration>
  <licenseurl>$_licence_url</licenseurl>
  <subject>audio magazine</subject>
  <subject>internet radio show</subject>
  <subject>new time radio</subject>
  <subject>onsug</subject>
  <subject>overnightscape underground</subject>
  <subject>podcasts</subject>
  <subject>$_subject</subject>
  <publicdate>$_date_time_utc</publicdate>
  <uploader>$_email</uploader>
  <taper>$_host</taper>
  <adder>$_email</adder>
  <addeddate>$_date_time_utc</addeddate>
  <year>$_year_utc</year>
  <coverage>$_location</coverage>
</metadata>
EOF

###########################################################

exit 0
