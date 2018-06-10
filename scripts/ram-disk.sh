#!/bin/sh

######
## Mount/destroy RAM disk for Hugo to generate site (to spare SSD)
## No longer needed for previews as of Hugo 0.17 (IIRC)
## 2015-12 - 2017-02
##

set -e
set -o nounset

_CAPACITY=256     ## Size in megabytes of target ramdisk
## _PATH="./public"  ## Target mountpoint where Hugo generates site

ram_disk() {
    _CAPACITY=`expr $_CAPACITY \* 2048`

    diskutil eraseVolume HFS+ 'Hugo' \
        `hdiutil attach -nomount ram://${_CAPACITY}`

    ## [ -d "$_PATH" ] && rm -rf "$_PATH"
    ## ln -s "/Volumes/Hugo" "$_PATH"
}

unmount_ram_disk() {
    hdiutil eject -force /Volumes/Hugo
    ## rm -rf $_PATH
}

