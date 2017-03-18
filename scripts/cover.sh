#!/bin/sh

######
## Create Rubénerd Show cover art
##
## 4 colour retro background with superimposed logo of a matching colour
## 2017-01-29

set -e
set -o nounset

_COLOUR=`mktemp`
_SIZE="640"
_LOGO="$HOME/Repos/rubenerd.com/metadata/cover.png"
_OUTPUT="$HOME/Repos/rubenerd.com/metadata/RubenerdShow$2.png"
_SOURCE=""

usage() {
    if [ $1 -ne 2 ]; then
        printf "%s\n" "Usage: ./create-cover.sh <image> <episode number>"
        exit 1
    fi
}

exists() {
    for tool in $1; do
        if ! command -v $1 > /dev/null 2>&1; then
            printf "%s" "$1 not installed, terminating."
            exit 1
        fi
    done
}

## Check parameters and dependencies
usage $#
exists "convert pngcrush"
_SOURCE="$1"

## Get image dimensions
## ping prevents whole image being loaded
_WIDTH=`identify -ping -format "%w" "$_SOURCE"`
_HEIGHT=`identify -ping -format "%h" "$_SOURCE"`

## Resize, but don't crop yet or it'll gen multiple files
if [ $_WIDTH -gt $_HEIGHT ]; then
    convert "$_SOURCE" -resize x${_SIZE} "$_OUTPUT"

else
    convert "$_SOURCE" -resize ${_SIZE}x "$_OUTPUT"
fi

## Crop resulting image
convert "$_OUTPUT"                \
    -gravity Center               \
    -crop ${_SIZE}x${_SIZE}+0+0!  \
    "${_OUTPUT}"

## Create colour mask
## Terrible hack, but saturate source, reduce to 1 pixel, then expand
convert "$_SOURCE"              \
    -normalize                  \
    -modulate 100,256,100       \
    -resize 1x1!                \
    -resize ${_SIZE}x${_SIZE}!  \
    "$_COLOUR"

## Overlay colour mask on source image
## My logo uses 4 colours for nostalgic pointlessness
## Other dither modes: "+dither", "-dither FloydSteinberg"
convert "$_OUTPUT"    \
    -posterize 4      \
    -colorspace gray  \
    "$_COLOUR"        \
    -compose overlay  \
    -composite        \
    "$_OUTPUT"

## Overlay colour mask on logo
convert "$_OUTPUT"    \
    +page "$_LOGO"    \
    -flatten          \
    -colorspace gray  \
    "$_COLOUR"        \
    -compose overlay  \
    -composite        \
    "$_OUTPUT"

## Reduce file size, and clean up
pngcrush -brute -reduce -ow "$_OUTPUT"
rm -rf "$_COLOUR"

## That's a wrap
exit 0

