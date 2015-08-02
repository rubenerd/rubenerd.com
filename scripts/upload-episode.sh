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

_episode_prefix='show'       ## http://rubenerd.com/show222/

###########################################################################
## Check depedendencies

[ -f "$_netrc" ] && grep -q onsug $_netrc && grep -q archive $_netrc || {
    echo "Either .netrc not found, or onsug and ia credentials not found";
    exit 1
}

###########################################################################
## Get latest episode filename (eg: "show282.html")

_latest="$_shows/`ls -1 $_shows | tail -n1`"

###########################################################################
## Get show ID

_id=`echo $_latest | sed 's/\.html//' | tr '/' ' ' | awk '{print $NF}'`

exit

###########################################################################
## Upload files to archive org

ftp items-uploads.archive.org <<EOF
binary
mkdir "$_id"
cd "$_id"
put "$_bucket/${_id}.mp3"
put "$_bucket/${_id}.png"
put "$_bucket/${_id}.jpg"
put "$_bucket/${_id}_files.xml"
put "$_bucket/${_id}_meta.xml"
ls
quit
EOF

## Ping Archive.org to get them to check for episode

curl "https://archive.org/services/contrib-submit.php?user_email=${_internet_archive_email}&server=items-uploads.archive.org&dir=${_id}"


## Commit manifest files to Git
#git add "./ia/${_id}_files.xml"
#git add "./ia/${_id}_meta.xml"
#git commit -m "internet archive meta xml for show${_episode_number}"
#git push origin master

###########################################################################
## Upload to Onsug

ftp onsug.com <<EOF
binary
cd "$_onsug_date"
mput "onsug*"
ls
quit
EOF

exit 0

## EOF
