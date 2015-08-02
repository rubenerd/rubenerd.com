#!/bin/sh

######
## Encodes file with lame

command -v lame >/dev/null 2>&1 || {
    echo "eyeD3 not installed, or not in \$PATH.";
    exit 1
}

lame -m j -q 0 --vbr-new -b 128 --verbose $1

