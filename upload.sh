#!/bin/sh

######
## Ruben's Hugo Post-Generate Script of Doom
## April 2015

set -e
set -o nounset

#. ./scripts/ramdisk.sh

_rsync='/usr/local/bin/rsync'  ## location of rsync
_server='rubenerd.com'         ## server to upload to
_virtual_root='rubenerdcom'    ## dest directory on server
_assets_folder='files'         ## don't delete this asset folder on upload

printf "%s" '☕  Killing any zombie Hugo processes...'
killall hugo &&

printf "%s" '☕  Clear previous generated assets...'
[ -d ./public ] && rm -rf ./public

## No longer needed in Hugo 0.16
##printf "%s" '☕  Create RAM disk...'
##[ -d "/Volumes/Hugo" ] || ram_disk

printf "%s" '☕  Building site with Hugo (may take a few moments)...'
hugo

printf "%s" '☕  Moving podcast feed to /show/feed/...'
mkdir -p ./public/show/feed/
mv -f ./public/category/show/index.xml ./public/show/feed/
cp ./themes/rubenerd/static/itunes-cover.png ./public/show/feed/

printf "%s" '☕  Moving RSS feed from index.xml to /feed/...'
mkdir ./public/feed/
mv -f ./public/index.xml ./public/feed/index.xml

printf "%s" '☕  Move Facebook tag...'
mv ./public/tag/facebook/index.xml ./public/facebook.xml

printf "%s" '☕  Removing all other generated feeds...'
rm -rf ./public/category/*/index.xml
rm -rf ./public/tag/*/index.xml

printf "%s" '☕  Removing /category/ from permalink...'
rm -rf ./public/category/index.*
mv -f ./public/category/show/* ./public/show/
rm -rf ./public/category/show/
mv -f ./public/category/* ./public/

printf "%s" '☕  Compressing (with rsync -z) and pushing to server...'
$_rsync --recursive --verbose --times --compress --rsh=ssh --checksum \
    --delete --exclude='files' ./public/ ${_server}:${_virtual_root}/

printf "%s" '☕  Site changes now LIVE.'

