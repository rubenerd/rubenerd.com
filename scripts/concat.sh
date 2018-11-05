#!/bin/sh

######
## Concatenate images
## 2018 Rubenerd Industries

set -e
set -x

_TARGET_WIDTH=400
_TARGET_FILE="out.jpg"

_IMAGE0=$1
_IMAGE1=$2

convert "$_IMAGE0" "$_IMAGE1" \
    -quality 98               \
    -fuzz 10                  \
    -trim                     \
    +append                   \
    -resize ${_TARGET_WIDTH}x \
    "$_TARGET_FILE"

