#!/bin/sh

######
## Encodes file with lame
## In future, will allow to convert from MP4/AAC and such
##
## 2015-08-20: Converts MP4/AAC
## 2015-07-27: Created

set -e

function exists() {
    if command -v $1 > /dev/null 2>&1; then
        return 0
    else
        echo "$1 not installed, terminating."
        return 1
    fi
}

## Check dependencies
exists 'lame' && exists 'normalize' && exists 'ffmpeg' || exit 1

echo $1

exit


## Encode!
lame -m j -q 0 --vbr-new -b 128 --verbose $1

## EOF
exit 0

