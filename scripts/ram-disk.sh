#!/bin/sh

######
## An Xmas gift for my poor old SSD: Creates a RAM disk before Hugo previews
## Ruben Schade 2015-12 <3
##

set -e
set -x

_disk_size=256

ram_disk() {
    _disk_size=`expr $_disk_size \* 2048`
    diskutil eraseVolume HFS+ 'Hugo' `hdiutil attach -nomount ram://${_disk_size}`
    rm -rf ../public
    ln -s /Volumes/Hugo/ public
}

unmount_ram_disk() {
    diskutil unmount force /Volumes/Hugo
    rm -rf public
}

