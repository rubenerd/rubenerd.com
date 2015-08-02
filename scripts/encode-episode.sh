#!/bin/sh

######
## Encodes file with lame
## In future, will allow to convert from MP4/AAC and such
##
## 2015-07-27: Created

set -e

## Check dependencies
command -v lame >/dev/null 2>&1 || {
    echo "lame not installed. Try running brew install lame.";
    exit 1
}

## Encode!
lame -m j -q 0 --vbr-new -b 128 --verbose $1

## EOF
exit 0

