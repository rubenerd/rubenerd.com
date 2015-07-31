#!/bin/sh

######
## Creates, formats and uploads new podcast episodes
## For Rubénerd Show and Snake Tea Podcast
## 
## 2015-07-27: Created

set -e


###########################################################
## User-editable configuration 

## Locations to find things
_home="/Users/`whoami`"
_bucket="$_home/Repositories/rubenerd-hugo/bucket"
_episodes="$_home/Repositories/rubenerd-hugo/content/post/show"
_episode_prefix='show'

## Episode details (will be asked for)
_show='Rubénerd Show'
_host='Ruben Schade'
_url='http://rubenerd.com/show/'
_licence_url='http://creativecommons.org/licenses/by/3.0/'
_licence_title='Creative Commons Attribution 3.0'
_location='Sydney, Australia'
_title='';          ## The something episode!
_number='300';
_description='';

## Frame URLs
_WPUB='http://rubenerd.com/show'

## Onsug details
_onsug_abbr='rs'  ## Onsug abbreviation onsug_DATE_rs000.mp3

## Internet Archive details
_collection='rubenerdshow'      ## such as "community-audio"
_email='rubenschade@gmail.com'  ## username
_subject='rubenerd'             ## gets added as a tag


###########################################################
## Automatically-generated configuration

## Text
_id=''                  ## eg "RubenerdShow218"
_description_text=''    ## without html
_size=0;                ## -> from mp3
_duration='00:00';      ## -> from mp3

## Dates
_date_time='';          ## for Hugo frontmatter
_date='';               ## for Hugo title
_date_time_utc='';      ## for Internet Archive
_date_utc='';           ## for Internet Archive
_year_utc='';           ## for Internet Archive
_onsug_file_date=''     ## eg "onsug.com/Jul15/file.mp3"
_onsug_release_date=''  ## eg "Released July 2015 on Onsug.."
_onsug_title_date=''    ## eg "Rubenerd Show 200 (7/12/15)"

## Formats for processing dates
_date_time_tz_fmt='%Y-%m-%dT%H:%M:%S%z';
_date_time_fmt='%Y-%m-%d %H:%M:%S';
_date_fmt='%Y-%m-%d';
_year_fmt='%Y';
_onsug_folder_date_fmt='%b%y';
_onsug_release_date_fmt='%B %Y';
_onsug_title_date_fmt='(%-m/%-d/%y)';


###########################################################
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
    printf "%s" "$1... "
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


###########################################################
## SCRIPT START 

## Splash screen!
clear
say "Ruben's and Clara's Podcast Generator 5000!"
say "==========================================="
say ""


###########################################################
## Check dependencies

[ -f "$_home/.netrc" ] && \
    command -v eyeD3 >/dev/null && \
    command -v convert >/dev/null || {
    say "~/.netrc, eyeD3 or ImageMagick/GraphicsMagick not found."
    say "Check they exist or are installed and try again."
    exit 1
}


###########################################################
## Get curent date and time (time is messy)

_date_time=`date +"$_date_time_tz_fmt" | sed 's/00$/:00/'`
_date=`date +"$_date_fmt"`
_year=`date +"$_year_fmt"`
_date_time_utc=`date -u +"$_date_time_fmt"`
_date_utc=`date -u +"$_date_fmt"`
_year_utc=`date -u +"$_year_fmt"`
_onsug_file_date=`date -u +"$_onsug_folder_date_fmt"`
_onsug_release_date=`date -u +"$_onsug_date_fmt"`
_onsug_title_date=`date -u +"$onsug_title_date_fmt"`


###########################################################
## Ask show host for details

_show=`ask "Name of the show" "$_show"`
_host=`ask "Host of the show" "$_host"`
_url=`ask "URL of site hosting show" "$_url"`
_number=`ask "Episode number" "$_number"`
_date_time=`ask "Release date and time" "$_date_time"`
_location=`ask "Location" "$_location"`
_licence_url=`ask "Licence URL" "$_licence_url"`
_licence_title=`ask "Licence URL" "$_licence_title"`
read -p "Episode title (The ... episode!): " _title
read -p "Episode description, in one line: " _description 


###########################################################
## Derive text 

say ""
say "Creating show ID and plain text description for MP3..."

## Convert show into id (removing spaces, etc)
_id=`printf "%s" "$_show$_number" | sed 's/ //g' | sed 's/é/e/'`

## Make plain text description for MP3 id3 tags, IA
_description_text=`strip "$_description"`


###########################################################
## Verify source MP3 and cover art, quit if we can't find

say ""
say "Will now search for the following assets:"

find "$_bucket/$_id.mp3"
find "$_bucket/$_id.png"


###########################################################
## Prepare filenames, images for onsug

say ""
say "Creating Onsug MP3 and image copies..."

cp "$_bucket/$_id.mp3" \
    "$_bucket/onsug_${_onsug_file_date}_$_onsug_abbr$_number.mp3"

convert -resize 288x288 "$_bucket/$_id.png" \
    "$_bucket/onsug_${_onsug_file_date}_$_onsug_abbr$_number.png"


###########################################################
## Create JPG cover art version for IA thumbnail

say ""
say "Creating JPG cover art for Internet Archive thumbnail..."

convert -quality 98 "$_bucket/$_id.png" "$_bucket/$_id.jpg"


###########################################################
## Create lyrics file for MP3

say ""
say "Creating lyrics file for MP3 from description..."

cat > "$_bucket/${_id}_lyrics.txt" <<EOF
$_title

$_duration – $_description_text

Recorded in $_location. Licence for this track: $_licence_title. Attribution: $_host.

Released $_onsug_release_date on The Overnightscape Underground, an Internet talk radio channel focusing on a freeform monologue style, with diverse and fascinating hosts.

EOF


###########################################################
## Tag Internet Archive mp3 with id3tags

eyeD3 \
    --remove-all \
    --artist "$_host" \
    --album "$_show" \
    --album-artist "$_host" \
    --title "$_show $_number $_date" \
    --track $_number \
    --genre "New Time Radio" \
    --release-year $_year \
    --add-lyrics "$_bucket/${_id}_lyrics.txt" \
    --add-image "$_bucket/${_id}.png:FRONT_COVER" \
    --encoding "utf8" \
    --url-frame "WOAF:http://archive.org/download/$_id/$_id.mp3"
    --url-frame "WOAS:http://rubenerd.com/show$_number.mp3"
    --url-frame "WCOP:$_licence_url" \
    --url-frame "WPUB:$_url" \
    --preserve-file-times \
    "$_bucket/$_id.mp3"


###########################################################
## Tag Onsug mp3 with id3tags

eyeD3 \
    --remove-all \
    --artist "$_host" \
    --album "Overnightscape Undeground - $_onsug_release_date" \
    --title "$_show $_description ($_onsug_title_date)" \
    --genre "New Time Radio" \
    --release-year $_year \
    --add-lyrics "$_bucket/${_id}_lyrics.txt" \
    --add-image "$_bucket/${_id}.png:FRONT_COVER" \
    --encoding "utf8" \
    --url-frame "WCOP:$_licence_url" \
    --url-frame "WPUB:$_url" \
    --preserve-file-times \
    "$_bucket/$_id.mp3"


###########################################################
## Get episode duration and size with cover art and lyrics

_size=`stat -f %z $_bucket/$_id.mp3`

_duration=`eyeD3 "$_bucket/$_id.mp3" | awk '/Time/ { print substr($2,0,length($2)) }'`

echo "DURATION: $_duration"

###########################################################
## Generate podcast episode for Hugo

say ""
say "Writing Hugo file to $_episodes/show$_number.html..."

cat > "$_episodes/$_id.html" <<EOF
---
title: "$_show $_number $_date"
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

say ""
say "Writing IA file manifest to $_bucket/${_id}_files.xml..."

printf "%s" '<files/>' > $_bucket/${_id}_files.xml

say ""
say "Writing IA meta file to $_bucket/${_id}_meta.xml..."

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
