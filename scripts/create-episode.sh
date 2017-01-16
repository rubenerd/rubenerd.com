#!/bin/sh

######
## Creates, formats and uploads new podcast episodes
## For Rubénerd Show and Snake Tea Podcast
## 
## 2015-07-27: Created

set -e


###########################################################################
## User-editable configuration 

## Locations to find things
_home="/Users/`whoami`"
_bucket="$_home/Repos/rubenerd.com/metadata"
_episodes="$_home/Repos/rubenerd.com/content/post/show"
_episode_prefix='show'

## Episode details (will be asked for)
_show='Rubénerd Show'
_host='Ruben Schade'
_url='https://rubenerd.com/show/'
_licence_url='http://creativecommons.org/licenses/by/3.0/'
_licence_title='Creative Commons Attribution 3.0'
_location='Sydney, Australia'
_title='';          ## The something episode!
_number='300';
_description='';

## Onsug details
_onsug_abbr='rs'  ## Onsug abbreviation" onsug_date_rs000.mp3"

## Internet Archive details
_collection='rubenerdshow'      ## such as "community-audio"
_email='rubenschade@gmail.com'  ## username
_subject='rubenerd'             ## gets added as a tag


###########################################################################
## Automatically-generated configuration

## Text
_id=''                  ## eg "RubenerdShow218"
_description_text=''    ## without html
_size=0;                ## -> from mp3
_duration='00:00';      ## -> from mp3
_city='';               ## from location "SYDNEY, australia"

## Dates
_date_time='';          ## for Hugo "date:" frontmatter
_date='';               ## for Hugo title
_date_time_utc='';      ## for Internet Archive metadata
_date_utc='';           ## for Internet Archive metadata
_year_utc='';           ## for Internet Archive metadata
_onsug_file_date=''     ## eg "onsug.com/Jul15/file.mp3"
_onsug_release_date=''  ## eg "Released July 2015 on Onsug.."
_onsug_title_date=''    ## eg "Rubenerd Show 200 (7/12/15)"


###########################################################################
## Helper functions

## Print standard string nicely
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

## Verifies file exists, otherwise exit script
function find() {
    _file=$1
    printf "%s" "$1 "
    if [ -f "$1" ]; then
        say "found! ^_^"
    else
        say "not found! ;_;"
        say "Can't continue. Check file and try again."
        exit 1
    fi
}

## Strips out HTML tags
function strip() {
    echo "$1" | sed -e :a -e 's/<[^>]*>//g;/</N;//ba'
}

## Escapes characters that prevent eyeD3 parsing
function escape() {
    echo "$1" | sed 's/\:/\\\:/g'
}


###########################################################################
## SCRIPT START                                                          ##
###########################################################################

## Splash screen!
clear
say "Ruben's and Clara's Podcast Generator 5000!"
say "==========================================="
say ""


###########################################################################
## Check dependencies

command -v eyeD3 >/dev/null && command -v gm >/dev/null || {
    say "eyeD3 or ImageMagick/GraphicsMagick not found. Please install."
    exit 1
}


###########################################################################
## Get curent date and time (time is messy)

_date_time=`date +"%Y-%m-%dT%H:%M:%S%z" | sed 's/00$/:00/'`
_date=`date +"%Y-%m-%d"`
_year=`date +"%Y"`
_date_time_utc=`date -u +"%Y-%m-%d %H:%M:%S"`
_date_utc=`date -u +"%Y-%m-%d"`
_year_utc=`date -u +"%Y"`
_onsug_file_date=`date -u +"%b%y"`
_onsug_release_date=`date -u +"%B %Y"`
_onsug_title_date=`date -u +"(%-m/%-d/%y)"`


###########################################################################
## Ask show host for basic details, make show ID and verify files exist

##_show=`ask "Name of the show" "$_show"`
_number=`ask "Episode number" "$_number"`

_id=`printf "%s" "$_show$_number" | sed 's/ //g' | sed 's/é/e/'`

say ""
find "$_bucket/$_id.mp3"
find "$_bucket/$_id.png"
say ""


###########################################################################
## Ask for more details

##_host=`ask "Host of the show" "$_host"`
##_url=`ask "URL of site hosting show" "$_url"`
##_date_time=`ask "Release date and time" "$_date_time"`
##_location=`ask "Location" "$_location"`
##_licence_url=`ask "Licence URL" "$_licence_url"`
##_licence_title=`ask "Licence URL" "$_licence_title"`
read -p "Episode title (The ... episode!): " _title
read -p "Episode description, in one line: " _description 


###########################################################################
## Derive text from entered details

## Make plain text description for MP3 id3 tags, IA
_description_text=`strip "$_description"`

## Get city from full location (for Hugo recorded-in-CITY tag)
_city=`echo "$_location" | sed 's/,//g' | awk '{ print tolower($1) }'`

###########################################################################
## Prepare filenames, images for Onsug and Internet Archive

cp "$_bucket/$_id.mp3" \
    "$_bucket/onsug_${_onsug_file_date}_$_onsug_abbr$_number.mp3"

gm convert -resize 288x288! "$_bucket/$_id.png" \
    "$_bucket/onsug_${_onsug_file_date}_$_onsug_abbr$_number.png"

gm convert -quality 98 "$_bucket/$_id.png" "$_bucket/$_id.jpg"


###########################################################################
## Get duration for show notes, lyrics file

_duration=`eyeD3 "$_bucket/$_id.mp3" 2> /dev/null | \
    awk '/Time:/ { print substr($2,6,length($2)) }'`


###########################################################################
## Create lyrics file for MP3

cat > "$_bucket/${_id}_lyrics.txt" <<EOF
$_duration – $_description_text

Recorded in $_location. Licence for this track: $_licence_title. Attribution: $_host.

Released $_onsug_release_date on Rubénerd and The Overnightscape Underground, an Internet talk radio channel focusing on a freeform monologue style, with diverse and fascinating hosts.

EOF


###########################################################################
## Tag Internet Archive mp3 with id3tags
eyeD3 \
    --remove-all \
    --artist "$_host" \
    --album "$_show" \
    --album-artist "$_host" \
    --title "$_number: $_title" \
    --track $_number \
    --genre "New Time Radio" \
    --release-year $_year \
    --release-date $_date \
    --orig-release-date $_date \
    --recording-date $_date \
    --encoding-date $_date \
    --tagging-date $_date \
    --add-lyrics "$_bucket/${_id}_lyrics.txt:SHOWNOTES:eng" \
    --add-image "$_bucket/${_id}.png:FRONT_COVER" \
    --encoding "utf8" \
    --publisher "$_host" \
    --url-frame "WOAF:https\://archive.org/download/$_id/$_id.mp3" \
    --url-frame "WOAR:https\://rubenerd.com/" \
    --url-frame "WOAS:https\://rubenerd.com/show$_number/" \
    --url-frame "WORS:https\://onsug.com/" \
    --url-frame "WCOP:`escape $_licence_url`" \
    --url-frame "WPUB:`escape $_url`" \
    --text-frame "TDRL:$_year" \
    --text-frame "TRSN:Overnightscape Underground" \
    --text-frame "TRSO:Frank Edward Nora" \
    --preserve-file-times \
    "$_bucket/$_id.mp3"


###########################################################################
## Tag Onsug mp3 with id3tags

eyeD3 \
    --remove-all \
    --artist "$_host" \
    --album "Overnightscape Underground - $_onsug_release_date" \
    --title "$_show $_number: $_title $_onsug_title_date" \
    --genre "New Time Radio" \
    --release-year $_year \
    --release-date $_year \
    --orig-release-date $_date \
    --recording-date $_date \
    --encoding-date $_date \
    --tagging-date $_date \
    --add-lyrics "$_bucket/${_id}_lyrics.txt:SHOWNOTES:eng" \
    --add-image "$_bucket/${_id}.png:FRONT_COVER" \
    --encoding "utf8" \
    --publisher "$_host" \
    --url-frame "WOAF:https\://archive.org/download/$_id/$_id.mp3" \
    --url-frame "WOAR:https\://rubenerd.com/" \
    --url-frame "WOAS:https\://rubenerd.com/show$_number/" \
    --url-frame "WORS:https\://rubenerd.com/" \
    --url-frame "WCOP:`escape $_licence_url`" \
    --url-frame "WPUB:http\://onsug.com/" \
    --text-frame "TDRL:$_year" \
    --text-frame "TRSN:Overnightscape Underground" \
    --text-frame "TRSO:Frank Edward Nora" \
    --preserve-file-times \
    "$_bucket/onsug_${_onsug_file_date}_$_onsug_abbr$_number.mp3"


###########################################################################
## Get episode size, now that it has cover art and lyrics

_size=`stat -f %z $_bucket/$_id.mp3`


###########################################################################
## Generate podcast episode for Hugo

say ""
say "Writing Hugo file to $_episodes/show$_number.html..."

cat > "$_episodes/show$_number.html" <<EOF
---
title: "$_show $_number: $_title"
date: "$_date_time"
summary: "$_title"
enclosure_file: "https://archive.org/download/$_id/$_id.mp3"
enclosure_size: "$_size"
enclosure_type: "audio/mpeg"
enclosure_duration: "$_duration"
location: "$_location"
category: Show
tag:
- audio-magazine
- new-time-radio
- podcast
- recorded-in-$_city
- the-overnightscape-underground
---
<p class="show-cover"><a href="https://archive.org/download/$_id/$_id.mp3" title="Listen to episode"><img src="https://archive.org/download/$_id/$_id.png" alt="$_show $_number" style="float:left; margin:0px 20px 5px 0px; width:180px; height:180px;" /></a></p>

<p class="show-download">Podcast: <a target="_blank" style="font-weight:bold" href="https://archive.org/download/$_id/$_id.mp3">Play in new window</a> | <a style="font-weight:bold;" href="https://archive.org/download/$_id/$_id.mp3">Download</a></p>

<p class="show-description"><span class="show-duration"><strong>$_duration</strong> – $_description</p>

<p class="show-licence">Recorded in $_location. Licence for this track: <a rel="license" href="$_licence_url">$_licence_title</a>. Attribution: $_host.</p>

<p class="show-release">Released $_onsug_release_date on <a href="http://onsug.com/">The Overnightscape Underground</a>, an Internet talk radio channel focusing on a freeform monologue style, with diverse and fascinating hosts.</p>

<p class="show-subscribe">Subscribe with <a href="https://itunes.apple.com/au/podcast/rubenerd-show/id1003680071">iTunes</a>, <a href="http://pca.st/ybXl">Pocket Casts</a>, <a href="https://overcast.fm/itunes1003680071/rub-nerd-show">Overcast</a> or add <a href="https://rubenerd.com/show/feed/">this feed</a> to your podcast client.</p>

EOF

###########################################################################
## Create Onsug text, and copy to clipboard

cat > "$_bucket/onsug_${_onsug_file_date}_$_onsug_abbr$_number.html" <<EOF
<p><img class="alignleft" src="http://onsug.com/shows/$_onsug_file_date/onsug_${_onsug_file_date}_$_onsug_abbr$_number.png" alt="" style="width:144px; height:144px;" /></p>

<p class="show-description"><strong>$_duration</strong> – $_description</p>

<p class="show-licence">Recorded in $_location. Licence for this track: <a rel="license" href="$_licence_url">$_licence_title</a>. Attribution: $_host.</p>

<p class="show-release">Released $_onsug_release_date on <a href="https://rubenerd.com/">Rubénerd</a> and <a href="http://onsug.com/">The Overnightscape Underground</a>, an Internet talk radio channel focusing on a freeform monologue style, with diverse and fascinating hosts.</p>
EOF

## If we're on Mac OS X, copy to clipboard for pasting into Onsug 
[ `uname` == "Darwin" ] && \
    cat "$_bucket/onsug_${_onsug_file_date}_$_onsug_abbr$_number.html" | \
    pbcopy -prefer txt


###########################################################################
## Generate Internet Archive metadata and file manifests

say ""
say "Writing IA file manifest to $_bucket/${_id}_files.xml..."

printf "%s" '<files/>' > $_bucket/${_id}_files.xml

say ""
say "Writing IA meta file to $_bucket/${_id}_meta.xml..."

cat > $_bucket/${_id}_meta.xml <<EOF
<?xml version="1.0" encoding="UTF-8"?>
<metadata>
  <identifier>$_id</identifier>
  <addeddate>$_date_time_utc</addeddate>
  <mediatype>audio</mediatype>
  <collection>$_collection</collection>
  <creator>$_host</creator>
  <date>$_date_utc</date>
  <description><![CDATA[
    <p><strong>$_duration</strong> – $_description</p><p style="font-style:italic" class="show-licence">Recorded in $_location. Licence for this track: <a rel="license" href="$_licence_url">$_licence_title</a>. Attribution: $_host.</p><p style="font-style:italic" class="show-release">Released $_onsug_release_date on <a href="https://rubenerd.com/">Rubénerd</a> and <a href="http://onsug.com/">The Overnightscape Underground</a>, an Internet talk radio channel focusing on a freeform monologue style, with diverse and fascinating hosts (this one notwithstanding).</p><p style="font-style:italic;" class="show-subscribe">Subscribe with <a href="https://itunes.apple.com/au/podcast/rubenerd-show/id1003680071">iTunes</a>, <a href="http://pca.st/ybXl">Pocket Casts</a>, <a href="https://overcast.fm/itunes1003680071/rub-nerd-show">Overcast</a> or add <a href="https://rubenerd.com/show/feed/">this feed</a> to your podcast client.</p><p style="font-style:italic" class="show-thanks">Special thanks to the <a href="https://archive.org/details/rubenerdshow">Internet Archive</a>; their generous hosting makes this show possible.</p>
  ]]></description>
  <language>eng</language>
  <duration>$_duration</duration>
  <licenseurl>$_licence_url</licenseurl>
  <scanner>Rubenerd Podcast Uploader 5000</scanner>
  <subject>audio magazine</subject>
  <title>$_show $_number: $_title</title>
  <subject>internet radio show</subject>
  <subject>new time radio</subject>
  <subject>onsug</subject>
  <subject>overnightscape underground</subject>
  <subject>podcasts</subject>
  <subject>recorded in $_city</subject>
  <subject>$_subject</subject>
  <publicdate>$_date_time_utc</publicdate>
  <uploader>$_email</uploader>
  <addeddate>$_date_time_utc</addeddate>
  <collection>audio_podcast</collection>
  <runtime>$_duration</runtime>
  <year>$_year_utc</year>
  <coverage>$_location</coverage>
</metadata>
EOF


###########################################################################
## Create spectogram for Internet Archive
##
## sox "${_id}.mp3" -n spectrogram ${_id}_spectrogram.png


###########################################################################
## Optimise images

pngcrush -brute "${_id}.png" "${_id}.png.out"
mv -f "${_id}.png.out" "${_id}.png"

pngcrush -brute "onsug_${_onsug_file_date}_$_onsug_abbr$_number.png" \
    "onsug_${_onsug_file_date}_$_onsug_abbr$_number.png.out"
mv -f "onsug_${_onsug_file_date}_$_onsug_abbr$_number.png.out" \
    "onsug_${_onsug_file_date}_$_onsug_abbr$_number.png"


###########################################################################

exit 0

