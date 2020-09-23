#!/bin/sh

######
## Ruben's Hugo Post-Generate Script of Doom
## April 2015

set -e
set -o nounset

. ./scripts/ram-disk.sh

_rsync='/usr/local/bin/rsync'  ## location of rsync
_server='rubenerd.com'         ## server to upload to
_disk='/Volumes/Hugo'          ## RAM disk to generate assets
_virtual_root='rubenerdcom'    ## dest directory on server
_assets_folder='files'         ## don't delete this asset folder on upload

printf "%s\n" '- Killing any zombie Hugo processes'
killall hugo &&

printf "%s\n" '- Clear previous generated assets'
[ -d $_disk ] && rm -rf ./public

printf "%s\n" '- Create RAM disk...'
[ -d "/Volumes/Hugo" ] || ram_disk

printf "%s\n" '- Building site with Hugo on RAM disk...'
hugo -d $_disk

printf "%s\n" '- Moving podcast feed to /show/feed/...'
mkdir -p $_disk/show/feed/
mv -f $_disk/category/show/index.xml $_disk/show/feed/
cp ./themes/rubenerd/static/itunes-cover.png $_disk/show/feed/

printf "%s\n" '- Moving main site RSS from index.xml to /feed/...'
mkdir $_disk/feed/
mv -f $_disk/index.xml $_disk/feed/index.xml

printf "%s\n" '- Fixing omake section that hugo eats...'
mv -f $_disk/omake-pages/index.html $_disk/omake/
rm -rf $_disk/omake-pages/

#printf "%s\n" '- Move Facebook tag...'
#mv $_disk/tag/facebook/index.xml ./public/facebook.xml

printf "%s\n" '- Removing all other RSS...'
rm -rf $_disk/category/*/index.xml
rm -rf $_disk/tag/*/index.xml

printf "%s\n" '- Removing /category/ from permalink...'
rm -rf $_disk/category/index.*
mv -f  $_disk/category/show/* $_disk/show/
rm -rf $_disk/category/show/
mv -f  $_disk/category/* $_disk/

printf "%s\n" '- Uploading...'
$_rsync --recursive --verbose --times --compress --rsh=ssh --checksum \
    --delete --exclude='files' $_disk/ ${_server}:${_virtual_root}/

printf "%s\n" '- Site changes now LIVE. Removing RAM disk...'
unmount_ram_disk

