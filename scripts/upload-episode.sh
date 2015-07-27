#!/bin/sh

######
## Uploads podcasts to Archive.org and Overnightscape Underground
##
## 2015-07-26: Created

set -e

## Variables for script operation
_time_fmt="%H:%M:%S"
_date_fmt="%Y-%m-%d"
_onsug_date_fmt="%b%y"
_episodes="content/post/show/"
_netrc="../../.netrc"

## Internet Archive details
_collection="rubenerdshow"
_creator="Ruben Schade"
_email="rubenschade@gmail.com"
_licence="http://creativecommons.org/licenses/by/3.0/"
_series_title="Rubénerd Show"
_subject="rubenerd"

## Check depedendencies
[ -f "${_netrc}" ] && grep -q onsug ${_netrc} && grep -q archive ${_netrc} || {
    echo "Either .netrc not found, or onsug and ia credentials not found";
    exit 1
}

## Get latest episode filename (eg: "show282.html")
_latest="${_episodes}`ls -1 ${_episodes} | tail -n1`"

## Get episode details
_title=`grep '^title' ${_latest} | awk '{ split($0,p,"\""); print p[2] }'`
_duration=`grep '^enclosure_duration' ${_latest} | awk '{ split($0,p,"\""); print p[2] }'`
_location=`grep '^location' ${_latest} | awk '{ split($0,p,"\""); print p[2] }'`
_description="`grep 'show-summary' ${_latest} | sed 's/<p/<span/' | sed 's/p>/span>/'`
`grep 'show-description' ${_latest} | sed 's/<p/<span/' | sed 's/p>/span>/'`"

## Let us know what episode we're processing 
echo "Building details for ${_title}..."

## Derive episode number and id from title
_episode_number=`echo ${_title} | awk '{ split($0,p," "); print p[3] }'`
_id="RubenerdShow${_episode_number}"

## Get current time (needs to be UTC/GMT)
_time=`date -u +"${_time_fmt}"`
_date=`date -u +"${_date_fmt}"`
_year=`date -u +"%Y"`
_onsug_date=`date -u +"{_onsug_date_fmt}"`

## Generate Internet Archive files manifest (let IA generate for us!)
echo '<files/>' > ./ia/${_id}_files.xml

## Generate Internet Archive metadata file
cat > ./ia/${_id}_meta.xml <<EOF
<?xml version="1.0" encoding="UTF-8"?>
<metadata>
  <identifier>${_id}</identifier>
  <mediatype>audio</mediatype>
  <collection>${_collection}</collection>
  <collection>audio_podcast</collection>
  <title>${_series_title} ${_episode_number}</title>
  <creator>${_creator}</creator>
  <date>${_date}</date>
  <description>${_description}</description>
  <language>eng</language>
  <duration>${_duration}</duration>
  <licenseurl>${_licence}</licenseurl>
  <subject>audio magazine</subject>
  <subject>internet radio show</subject>
  <subject>new time radio</subject>
  <subject>onsug</subject>
  <subject>overnightscape underground</subject>
  <subject>podcasts</subject>
  <subject>${_subject}</subject>
  <publicdate>${_date} ${_time}</publicdate>
  <uploader>${_email}</uploader>
  <taper>${_creator}</taper>
  <adder>${_email}</adder>
  <addeddate>${_date} ${_time}</addeddate>
  <year>${_year}</year>
  <coverage>${_location}</coverage>
</metadata>
EOF

upload_to_internet_archive() {
ftp items-uploads.archive.org <<EOF
binary
mkdir "${_id}"
cd "${_id}"
put "./ia/${_id}.mp3"
put "./ia/${_id}.png"
put "./ia/${_id}.jpg"
put "./ia/${_id}_files.xml"
put "./ia/${_id}_meta.xml"
EOF
}

## Commit manifest files to Git
git add "./ia/${_id}_files.xml"
git add "./ia/${_id}_meta.xml"
git commit -m "internet archive meta xml for show${_episode_number}"
git push origin master

#_onsug_mp3_file=`"onsug_${_onsug_date}_rs${_episode_number}"`

## And now we can upload!
#ftp onsug.com <<EOF
#binary
#cd "${_onsug_date}"
#
#quit
#EOF

exit 0

## EOF
