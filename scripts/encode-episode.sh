#!/bin/sh

######
## Podcast CAF->WAV->MP3 encoder
## I prefer AAC, but there are stragglers
##
## 2015-11-26: Cleaned up, use CAF as input format now
## 2015-08-20: Converts MP4/AAC
## 2015-07-27: Created

set -e
set -x

exists() {
    for tool in $1; do
        if command -v $1 > /dev/null 2>&1; then
            return 0
        else
            echo "$1 not installed, terminating."
            return 1
        fi
    done
}

## Check dependencies
exists "ffmpeg flac lame normalize" || exit 1

## Get name and strip extension
_original=$1
_id=`printf "%s" "$_original" | sed 's/\.caf$//g'`

## Convert to WAV
ffmpeg -i "$_original" "$_id.wav"

## Encode to MP3
lame -m j -q 0 --vbr-new -b 128 --verbose "$_id.wav"

## Encode to FLAC for archiving
flac --delete-input-file --preserve-modtime --verify --best "$_id.wav"

## If we have what we need, delete original
[ -f "$_id.flac" ] && [ -f "$_id.mp3" ]

## That's a wrap
exit 0

