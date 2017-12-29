#!/bin/sh

######
## Creates, formats and uploads new podcast episodes
## For Rubénerd Show and Snake Tea Podcast
## 
## 2015-07-27: Created
## 2017-01-30: Refactored for arguments (not interactive) + IA upload tool

set -e
set -o nounset
set -x 

###########################################################################
## User-editable configuration 

## Taken as arguments
_NUMBER=""
_TITLE=""
_DESCRIPTION=""

## Where to find things
_BUCKET="$HOME/Personal/rubenerd.com/metadata"
_EPISODES="$HOME/Personal/rubenerd.com/content/post/show"
_EPISODE_PREFIX='show'

## Episode details
_SHOW='Rubénerd Show'
_HOST='Ruben Schade'
_URL='https://rubenerd.com/show/'
_LICENCE_URL='http://creativecommons.org/licenses/by/3.0/'
_LICENCE_TITLE='Creative Commons Attribution 3.0'
_LOCATION='North Sydney, Australia'

## Network details
_ONSUG_ABBR='rs'                ## Onsug abbreviation" onsug_DATE_rs000.mp3"
_COLLECTION='rubenerdshow'      ## IA collection, such as "community-audio"
_EMAIL='me@rubenschade.com'     ## IA username/email
_MARC_LANGUAGE="eng"            ## MARC21 language code
_SUBJECT='rubenerd'             ## IA tag additions
_ONSUG_COVER_SIZE=288           ## HxW dimensions for Onsug site cover art


###########################################################################
## Automatically-generated configuration

## Text
_ID=''                ## eg "RubenerdShow218"
_DESCRIPTION_TEXT=''  ## without html
_SIZE=0;              ## from mp3
_DURATION='00:00';    ## from mp3
_CITY='';             ## from $_LOCATION "SYDNEY, australia"

## Dates
_DATE_TIME=`date +"%Y-%m-%dT%H:%M:%S%z" | sed 's/00$/:00/'`  ## for Hugo "date:" frontmatter
_DATE=`date +"%Y-%m-%d"`                                     ## for Hugo title
_YEAR=`date +"%Y"`                                           ## for Onsug folder
_DATE_TIME_UTC=`date -u +"%Y-%m-%d %H:%M:%S"`                ## for Internet Archive metadata
_DATE_UTC=`date -u +"%Y-%m-%d"`                              ## for Internet Archive metadata
_YEAR_UTC=`date -u +"%Y"`                                    ## for Internet Archive metadata
_ONSUG_FILE_DATE=`date -u +"%b%y"`                           ## part of the Onsug filename
_ONSUG_RELEASE_DATE=`date -u +"%B %Y"`                       ## "Released July 2015 on Onsug..."
_ONSUG_TITLE_DATE=`date -u +"(%-m/%-d/%y)"`                  ## for Onsug title


###########################################################################
## Helper functions

## Check command like arguments
usage() {
    if [ $1 -ne 3 ]; then
        say "Usage: ./create-episode.sh <episode number> <title> <description>"
        exit 1
    fi
}

## Check dependencies
dependencies() {
    for tool in $1; do
        if ! command -v $1 > /dev/null 2>&1; then
            printf "%s" "$1 not installed, terminating."
            exit 1
        fi
    done
}

## Print standard string nicely
say() { 
    printf "%s\n" "$1"
}

## Verifies file exists, otherwise exit script
find() {
    _FILE=$1
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
strip() {
    printf "%s" "$1" | sed -e :a -e 's/<[^>]*>//g;/</N;//ba'
}

## Escapes characters that prevent eyeD3 parsing
escape() {
    printf "%s" "$1" | sed 's/\:/\\\:/g'
}


###########################################################################
## SCRIPT START                                                          ##
###########################################################################

## Confirm arguments and dependencies met
usage $#
dependencies "convert eyeD3 ia jpegoptim pngcrush"

## Assign arguments when confirmed
_NUMBER="$1"
_TITLE="$2"
_DESCRIPTION="$3"

## Create ID, and verify required files exist
_ID=`printf "%s" "$_SHOW$_NUMBER" | sed 's/ //g' | sed 's/é/e/'`
find "$_BUCKET/$_ID.mp3"
find "$_BUCKET/$_ID.png"


###########################################################################
## Derive text from entered details

## Make plain text description for MP3 id3 tags, IA
_DESCRIPTION_TEXT=`strip "$_DESCRIPTION"`

## Get city from full $_LOCATION (for Hugo recorded-in-city tag)
_CITY=`echo "$_LOCATION" | sed 's/,//g' | awk '{ print tolower($1) }'`


###########################################################################
## Prepare filenames and covers

cp "$_BUCKET/$_ID.mp3" \
    "$_BUCKET/onsug_${_ONSUG_FILE_DATE}_$_ONSUG_ABBR$_NUMBER.mp3"

convert                                                            \
    -resize ${_ONSUG_COVER_SIZE}x${_ONSUG_COVER_SIZE}!             \
    "$_BUCKET/$_ID.png"                                            \
    "$_BUCKET/onsug_${_ONSUG_FILE_DATE}_$_ONSUG_ABBR$_NUMBER.png"

convert                                                            \
    -quality 98                                                    \
    "$_BUCKET/$_ID.png"                                            \
    "$_BUCKET/$_ID.jpg"

pngcrush -ow "$_BUCKET/${_ID}.png"
pngcrush -ow "$_BUCKET/onsug_${_ONSUG_FILE_DATE}_$_ONSUG_ABBR$_NUMBER.png"
jpegoptim --preserve --totals --verbose "$_BUCKET/${_ID}.jpg"


###########################################################################
## Get duration for show notes, lyrics file

_DURATION=`eyeD3 "$_BUCKET/$_ID.mp3" 2> /dev/null | \
    awk '/Time:/ { print substr($2,6,length($2)) }'`


###########################################################################
## Create lyrics file for MP3

cat > "$_BUCKET/${_ID}_lyrics.txt" <<EOF
$_DURATION – $_DESCRIPTION_TEXT

Recorded in $_LOCATION. Licence for this track: $_LICENCE_TITLE. Attribution: $_HOST.

Released $_ONSUG_RELEASE_DATE on Rubénerd and The Overnightscape Underground, an Internet talk radio channel focusing on a freeform monologue style, with diverse and fascinating hosts.

EOF


###########################################################################
## Tag MP3s

## Need to remove existing first now, otherwise eyeD3 0.8.x throws an error
## Uncaught exception: 'NoneType' object has no attribute 'file_info'
##eyeD3 --remove-all "$_BUCKET/$_ID.mp3"

## Internet Archive
eyeD3                                                               \
    --artist "$_HOST"                                               \
    --album "$_SHOW"                                                \
    --album-artist "$_HOST"                                         \
    --title "$_NUMBER: $_TITLE"                                     \
    --track $_NUMBER                                                \
    --genre "New Time Radio"                                        \
    --release-year $_YEAR                                           \
    --release-date $_DATE                                           \
    --orig-release-date $_DATE                                      \
    --recording-date $_DATE                                         \
    --encoding-date $_DATE                                          \
    --tagging-date $_DATE                                           \
    --add-lyrics "$_BUCKET/${_ID}_lyrics.txt:SHOWNOTES:eng"         \
    --add-image "$_BUCKET/${_ID}.png:FRONT_COVER"                   \
    --encoding "utf8"                                               \
    --publisher "$_HOST"                                            \
    --url-frame "WOAF:https\://archive.org/download/$_ID/$_ID.mp3"  \
    --url-frame "WOAR:https\://rubenerd.com/"                       \
    --url-frame "WOAS:https\://rubenerd.com/show$_NUMBER/"          \
    --url-frame "WORS:https\://onsug.com/"                          \
    --url-frame "WCOP:`escape $_LICENCE_URL`"                       \
    --url-frame "WPUB:`escape $_URL`"                               \
    --text-frame "TDRL:$_YEAR"                                      \
    --text-frame "TRSN:Overnightscape Underground"                  \
    --text-frame "TRSO:Frank Edward Nora"                           \
    --preserve-file-times                                           \
    "$_BUCKET/$_ID.mp3"

## Onsug
eyeD3                                                               \
    --artist "$_HOST"                                               \
    --album "Overnightscape Underground - $_ONSUG_RELEASE_DATE"     \
    --title "$_SHOW $_NUMBER: $_TITLE $_ONSUG_TITLE_DATE"           \
    --genre "New Time Radio"                                        \
    --release-year $_YEAR                                           \
    --release-date $_YEAR                                           \
    --orig-release-date $_DATE                                      \
    --recording-date $_DATE                                         \
    --encoding-date $_DATE                                          \
    --tagging-date $_DATE                                           \
    --add-lyrics "$_BUCKET/${_ID}_lyrics.txt:SHOWNOTES:eng"         \
    --add-image "$_BUCKET/${_ID}.png:FRONT_COVER"                   \
    --encoding "utf8"                                               \
    --publisher "$_HOST"                                            \
    --url-frame "WOAF:https\://archive.org/download/$_ID/$_ID.mp3"  \
    --url-frame "WOAR:https\://rubenerd.com/"                       \
    --url-frame "WOAS:https\://rubenerd.com/show$_NUMBER/"          \
    --url-frame "WORS:https\://rubenerd.com/"                       \
    --url-frame "WCOP:`escape $_LICENCE_URL`"                       \
    --url-frame "WPUB:http\://onsug.com/"                           \
    --text-frame "TDRL:$_YEAR"                                      \
    --text-frame "TRSN:Overnightscape Underground"                  \
    --text-frame "TRSO:Frank Edward Nora"                           \
    --preserve-file-times                                           \
    "$_BUCKET/onsug_${_ONSUG_FILE_DATE}_$_ONSUG_ABBR$_NUMBER.mp3"


###########################################################################
## Get episode size, now that it has cover art and lyrics

_SIZE=`stat -f %z $_BUCKET/$_ID.mp3`


###########################################################################
## Generate podcast episode for Hugo

say ""
say "Writing Hugo file to $_EPISODES/show$_NUMBER.html..."

cat > "$_EPISODES/show$_NUMBER.html" <<EOF
---
title: "$_SHOW $_NUMBER: $_TITLE"
date: "$_DATE_TIME"
abstract: "$_TITLE"
thumb: "https://archive.org/download/$_ID/$_ID.png"
enclosure_file: "https://archive.org/download/$_ID/$_ID.mp3"
enclosure_size: "$_SIZE"
enclosure_type: "audio/mpeg"
enclosure_duration: "$_DURATION"
location: "$_LOCATION"
category: Show
tag:
- audio-magazine
- new-time-radio
- podcast
- recorded-in-$_CITY
- the-overnightscape-underground
---
<p class="show-cover"><a href="https://archive.org/download/$_ID/$_ID.mp3" title="Listen to episode"><img src="https://archive.org/download/$_ID/$_ID.png" alt="$_SHOW $_NUMBER" style="float:left; margin:0px 20px 5px 0px; width:180px; height:180px;" /></a></p>

<p class="show-download">Podcast: <a target="_blank" style="font-weight:bold" href="https://archive.org/download/$_ID/$_ID.mp3">Play in new window</a> | <a style="font-weight:bold;" href="https://archive.org/download/$_ID/$_ID.mp3">Download</a></p>

<p class="show-description"><span class="show-duration"><strong>$_DURATION</strong></span> – $_DESCRIPTION</p>

<p class="show-licence">Recorded in $_LOCATION. Licence for this track: <a rel="license" href="$_LICENCE_URL">$_LICENCE_TITLE</a>. Attribution: $_HOST.</p>

<p class="show-release">Released $_ONSUG_RELEASE_DATE on <a href="http://onsug.com/">The Overnightscape Underground</a>, an Internet talk radio channel focusing on a freeform monologue style, with diverse and fascinating hosts.</p>

<p class="show-subscribe">Subscribe with <a href="https://itunes.apple.com/au/podcast/rubenerd-show/id1003680071">iTunes</a>, <a href="http://pca.st/ybXl">Pocket Casts</a>, <a href="https://overcast.fm/itunes1003680071/rub-nerd-show">Overcast</a> or add <a href="https://rubenerd.com/show/feed/">this feed</a> to your podcast client.</p>

EOF


###########################################################################
## Create Onsug text, and copy to clipboard

cat > "$_BUCKET/onsug_${_ONSUG_FILE_DATE}_$_ONSUG_ABBR$_NUMBER.html" <<EOF
<p><img class="alignleft" src="http://onsug.com/shows/$_ONSUG_FILE_DATE/onsug_${_ONSUG_FILE_DATE}_$_ONSUG_ABBR$_NUMBER.png" alt="" style="width:144px; height:144px;" /></p>

<p class="show-description"><strong>$_DURATION</strong> – $_DESCRIPTION</p>

<p class="show-licence">Recorded in $_LOCATION. Licence for this track: <a rel="license" href="$_LICENCE_URL">$_LICENCE_TITLE</a>. Attribution: $_HOST.</p>

<p class="show-release">Released $_ONSUG_RELEASE_DATE on <a href="https://rubenerd.com/">Rubénerd</a> and <a href="http://onsug.com/">The Overnightscape Underground</a>, an Internet talk radio channel focusing on a freeform monologue style, with diverse and fascinating hosts.</p>
EOF

## If we're on Mac OS X, copy to clipboard for pasting into Onsug 
if [ `uname` = "Darwin" ]; then
    cat "$_BUCKET/onsug_${_ONSUG_FILE_DATE}_$_ONSUG_ABBR$_NUMBER.html" | \
    pbcopy -prefer txt
fi


###########################################################################
## Confirm with user, then upload

printf "Content generated. Confirm, then hit <ENTER> to confirm, or <CTRL>+<C> to terminate."
read _ENTER


###########################################################################
## Upload to Onsug

ncftp onsug <<EOF
binary
cd "$_ONSUG_FILE_DATE"
lcd "$_BUCKET"
put "onsug_${_ONSUG_FILE_DATE}_$_ONSUG_ABBR$_NUMBER.mp3"
put "onsug_${_ONSUG_FILE_DATE}_$_ONSUG_ABBR$_NUMBER.png"
ls
quit
EOF


###########################################################################
## Generate metadata and upload to Internet Archive

_IA_DESCRIPTION="<p><strong>$_DURATION</strong> – $_DESCRIPTION</p><p style=\"font-style:italic\" class=\"show-licence\">Recorded in $_LOCATION. Licence for this track: <a rel=\"license\" href=\"$_LICENCE_URL\">$_LICENCE_TITLE</a>. Attribution: $_HOST.</p><p style=\"font-style:italic\" class=\"show-release\">Released $_ONSUG_RELEASE_DATE on <a href=\"https://rubenerd.com/\">Rubénerd</a> and <a href=\"http://onsug.com/\">The Overnightscape Underground</a>, an Internet talk radio channel focusing on a freeform monologue style, with diverse and fascinating hosts (this one notwithstanding).</p><p style=\"font-style:italic;\" class=\"show-subscribe\">Subscribe with <a href=\"https://itunes.apple.com/au/podcast/rubenerd-show/id1003680071\">iTunes</a>, <a href=\"http://pca.st/ybXl\">Pocket Casts</a>, <a href=\"https://overcast.fm/itunes1003680071/rub-nerd-show\">Overcast</a> or add <a href=\"https://rubenerd.com/show/feed/\">this feed</a> to your podcast client.</p><p style=\"font-style:italic\" class=\"show-thanks\">Special thanks to the <a href=\"https://archive.org/details/rubenerdshow\">Internet Archive</a>; their generous hosting makes this show possible.</p>"

echo "collection,contributor,coverage,creator,date,description,duration,language,licenseurl,mediatype,runtime,scanner,subject[0],subject[1],subject[2],subject[3],subject[4],subject[5],subject[6],subject[7],title,year" > "$_ID.csv"

echo "$_COLLECTION,$_HOST,$_LOCATION,$_HOST,$_DATE_UTC,$_IA_DESCRIPTION,$_DURATION,$_MARC_LANGUAGE,$_LICENCE_URL,audio,$_DURATION,Rubenerd Podcast Uploader 5000,audio magazine,internet radio show,new time radio,onsug,overnightscape underground,podcasts,recorded in $_CITY,$_SUBJECT,$_SHOW $_NUMBER: $_TITLE,$_YEAR" >> "$_ID.csv"

ia upload                                                \
    "$_ID"                                               \
    "$_ID.mp3"                                           \
    "$_ID.png"                                           \
    "$_ID.jpg"                                           \
    "$_ID.flac"                                          \
    --metadata="collection:$_COLLECTION"                 \
    --metadata="contributor:$_HOST"                      \
    --metadata="coverage:$_LOCATION"                     \
    --metadata="creator:$_HOST"                          \
    --metadata="date:$_DATE_UTC"                         \
    --metadata="description:$_IA_DESCRIPTION"            \
    --metadata="duration:$_DURATION"                     \
    --metadata="language:$_MARC_LANGUAGE"                \
    --metadata="licenseurl:$_LICENCE_URL"                \
    --metadata="mediatype:audio"                         \
    --metadata="runtime:$_DURATION"                      \
    --metadata="scanner:Rubenerd Podcast Uploader 5000"  \
    --metadata="subject:audio magazine"                  \
    --metadata="subject:internet radio show"             \
    --metadata="subject:new time radio"                  \
    --metadata="subject:onsug"                           \
    --metadata="subject:overnightscape underground"      \
    --metadata="subject:podcasts"                        \
    --metadata="subject:recoreded in $_CITY"             \
    --metadata="subject:$_SUBJECT"                       \
    --metadata="title: $_SHOW $_NUMBER: $_TITLE"         \
    --metadata="year: $_YEAR"


###########################################################################
## That's a wrap

exit 0

