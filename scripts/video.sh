#!/bin/sh

######
## Generate video thumbnails
## Rubenerd Industries

SERVER="rubenerd.com"

PLAY1X="../metadata/play@1x.png"
PLAY2X="../metadata/play@2x.png"

## Download video thumbnail
VIDEO=`youtube-dl --get-thumb --no-warnings $1 | tail -1`
curl -Lo "video.jpg" "$VIDEO"

## Get video title
TITLE=`youtube-dl --get-title --no-warnings $1 | tail -1`

## Get video ID
ID=`echo $1 | awk -F= '{ print $2 }'`

## Get year for archive
YEAR=`date '+%Y'`

## Generate image URLs
## TODO: Make clipboard copy work on FreeBSD, not just macOS
FILE="https://rubenerd.com/files/$YEAR/yt-$ID"
HTML="<p><a href=\"$1\" title=\"Play $TITLE\"><img src=\"$FILE@1x.jpg\" srcset=\"$FILE@1x.jpg 1x, $FILE@2x.jpg 2x\" alt=\"Play $TITLE\" style=\"width:500px;height:281px;\" /></a></p>"
echo $HTML | pbcopy

## Create thumbnails
convert -resize 1000x563 "video.jpg" -quality 97 -crop 1000x562+0+0 +repage \
    +page "$PLAY2X" -flatten "yt-$ID@2x.jpg"
convert -resize 500x281 "video.jpg" -quality 97 "yt-$ID@1x.jpg" \
    +page "$PLAY1X" -flatten "yt-$ID@1x.jpg"

## Upload files and delete on success
scp yt-$ID@*jpg $SERVER:$YEAR/ && rm -rf yt-$ID@*jpg

