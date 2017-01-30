#!/bin/sh

######
## Podcast CAF->WAV->MP3 encoder
## I prefer AAC, but there are stragglers
##
## 2015-11-26: Cleaned up, use CAF as input format now
## 2015-08-20: Converts MP4/AAC
## 2015-07-27: Created
## 2017-01-27: Delete originals, set time stamps

set -e
set -x

exists() {
    for tool in $1; do
        if ! command -v $1 > /dev/null 2>&1; then
            printf "%s" "$1 not installed, terminating."
            exit 1
        fi
    done
}

## Check dependencies
exists "avconv flac lame normalize"

## Get name and strip extension
_original=$1
_id=`basename "$1" ".caf"`

## Convert to WAV
## afconvert "$_original" "$_id.wav"
avconv -i "$_original" "$_id.wav"

## Encode to MP3
lame -m j -q 0 --vbr-new -b 128 --verbose "$_id.wav"
touch -r "$_original" "$_id.mp3"

## Encode to FLAC for archiving
flac --delete-input-file --preserve-modtime --verify --best "$_id.wav"

## If we have what we need, delete original
if [ -f "$_id.flac" ] && [ -f "$_id.mp3" ]; then
    rm -rf "$_original"
fi

## That's a wrap
exit 0

