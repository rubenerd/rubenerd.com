#!/bin/sh

######
## Uploads podcasts to Archive.org and Overnightscape Underground
##
## 2015-08-01: Refactored without file creation, just uploading
## 2015-07-26: Created

set -e

###########################################################################
## Configuration

_bucket="/Users/`whoami`/Repositories/rubenerd-hugo/bucket"
_netrc="/Users/`whoami`/.netrc"
_shows="/Users/`whoami`/Repositories/rubenerd-hugo/content/post/show"
_internet_archive_email="rubenschade@gmail.com"

_hugo_prefix='show'        ## eg http://rubenerd.com/show222/
_ia_prefix='RubenerdShow'  ## eg http://archive.org/details/RubenerdShow20/
_onsug_prefix='rs'         ## eg onsug_Aug15_rs300.mp3

###########################################################################
## Check depedendencies

[ -f "$_netrc" ] && grep -q onsug $_netrc && grep -q archive $_netrc || {
    echo "Either .netrc not found, or onsug and ia credentials not found";
    exit 1
}

###########################################################################
## Get latest episode number

## -> "path/to/folder/show200.html"
_latest_file="$_shows/`ls -1 $_shows | tail -n1`"

## -> "show200"
_id=`echo $_latest_file | sed 's/\.html//' | tr '/' ' ' | awk '{print $NF}'`

## -> "200"
_number=`echo $_id | sed "s/$_hugo_prefix//"`

## -> "RubenerdShow200"
_id="$_ia_prefix$_number"

echo $_id

###########################################################################
## Upload files to archive org

ftp items-uploads.archive.org <<EOF
binary
mkdir "$_id"
cd "$_id"
lcd "$_bucket"
put "${_id}.mp3"
put "${_id}.png"
put "${_id}.jpg"
put "${_id}_files.xml"
put "${_id}_meta.xml"
ls
quit
EOF

## Ping Archive.org to get them to check for episode

curl "https://archive.org/services/contrib-submit.php?user_email=${_internet_archive_email}&server=items-uploads.archive.org&dir=${_id}"

exit

###########################################################################
## Upload to Onsug

ftp onsug.com <<EOF
binary
cd "$_onsug_date"
mput "onsug*$_number*"
ls
quit
EOF

###########################################################################
## Commit manifest files to Git

git add "./bucket/*"
git add "./ia/${_id}_meta.xml"
git commit -m "internet archive meta xml for show${_episode_number}"
git push origin master

exit 0

## EOF
