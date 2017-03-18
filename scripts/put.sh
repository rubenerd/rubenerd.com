#!/bin/sh

######
## Scripts to put episodes onto networks
##

upload_to_onsug() {
    $_ONSUG_ID="$1"
    $_ONSUG_DATE="$2"
    $_SOURCE="$3"

    ftp onsug.com <<EOF
binary
cd "$_ONSUG_DATE"
lcd "$_BUCKET"
put "$_ONSUG_ID.mp3"
put "$_ONSUG_ID.png"
ls
quit
EOF

}

upload_to_internet_archive() {
    $_ID="$1"

    ia upload "$_ID" \
        "$_ID.mp3" \
        "$_ID.png" \
        "$_ID.jpg" \
        "$_ID.flac" \
        --spreadsheet="$_ID.csv"
}


