#!/bin/sh

######
## Podcast CAF->aiff->MP3|FLAC transcoding
## I prefer AAC, but there are stragglers
##
## 2015-11-26: Cleaned up, use CAF as input format now
## 2015-08-20: Converts MP4/AAC
## 2015-07-27: Created
## 2017-01-27: Delete originals, set time stamps
## 2017-01-31: Use afconvert where available

set -e
set -o nounset
IFS=" "

exists() {
    for tool in $1; do
        if ! command -v $1 > /dev/null 2>&1; then
            printf "%s" "$1 not installed, terminating."
            exit 1
        fi
    done
}

params() {
    if [ $1 -lt 1 ]; then
        printf "%s" "Usage: ./encode-episode.sh <audio files>"
    fi
}

## Check dependencies and params
exists "flac lame normalize"
params $#

## Get name and strip extension
_original=$1
_id=`basename "$1" ".caf"`

## Convert to aiff
## afconvert -f AIFF -d I8 "$_original" "$_id.aiff"
ffmpeg -i "$_original" "$_id.aiff"

## Encode to MP3
## Some podcast clients *still* choke on VBR, so ignore for now
## lame -m j -q 0 --vbr-new -b 128 --verbose "$_id.aiff"
## lame -m j -q 0 --preset cbr 128 --verbose "$_id.aiff"
lame --cbr -m j -q 0 -b 128 --verbose "$_id.aiff"
touch -r "$_original" "$_id.mp3"

## Encode to FLAC for archiving
flac --delete-input-file --preserve-modtime --verify --best "$_id.aiff"

## If we have what we need, delete original
if [ -f "$_id.flac" ] && [ -f "$_id.mp3" ]; then
    rm -rf "$_original"
    exit 0
else
    printf "Expected output files not found, check commands."
    exit 1
fi

## That's a wrap

