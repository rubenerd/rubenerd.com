#!/bin/sh

######
## Generates Retina and quarter size images for blogs
## 2017-01

_RETINA_WIDTH=1000
_SMALL_WIDTH=`expr $_RETINA_WIDTH / 2`
_COMMENT="From Rubenerd, Ruben's weblog of nerdish interests"
_FOLDER="https://rubenerd.com/files/`date +%Y`"

set -e


## Check arguments and dependencies #######################################
if [ $# != 1 ]; then
    printf "%s\n" "Usage (and abusage): ./retina.sh [image]"
    exit 1
elif ! `command -v gm &> /dev/null`; then 
    printf "%s\n" "GraphicsMagick not found, exiting"
    exit 1
else
    _SRC=$1;
fi


## Create names ###########################################################
_FILE=`gm identify -format %t $_SRC`
_EXT=`gm identify -format %e $_SRC`
_RETINA_IMG="$_FILE@2x.$_EXT"
_SMALL_IMG="$_FILE@1x.$_EXT"


## Get image attributes ###################################################
_WIDTH=`gm identify -format %w $_SRC`
_HEIGHT=`gm identify -format %h $_SRC`
_QUALITY=`gm identify -format %Q $_SRC`


## Shrink image if too wide for retina ####################################
if [ $_WIDTH -gt $_RETINA_WIDTH ]; then
    _WIDTH=$_RETINA_WIDTH

    gm convert \
        "$_SRC" \
        -comment "$_COMMENT" \
        -resize ${_WIDTH}x! \
        -quality $_QUALITY \
        "$_RETINA_IMG"
else
    cp "$_SRC" "$_RETINA_IMG" 
    cp "$_SRC" "$_SMALL_IMG" 
fi

## Crop if not /2 (Retina has to be double) ###############################
_HEIGHT=`gm identify -format %h $_RETINA_IMG`

if expr $_HEIGHT % 2 &> /dev/null; then
    _HEIGHT=`expr $_HEIGHT - 1`

    gm mogrify \
        -crop ${_RETINA_WIDTH}x${_HEIGHT}! \
        "$_RETINA_IMG" 
fi


## Create 1x image ########################################################
_SMALL_WIDTH=`expr $_WIDTH / 2`
_SMALL_HEIGHT=`expr $_HEIGHT / 2`

gm convert \
    "$_SRC" \
    -comment "$_COMMENT" \
    -resize "$_SMALL_WIDTH" \
    -quality "$_QUALITY" \
    "$_SMALL_IMG"


## GENERATE HTML ##########################################################

_HTML="<p><img src=\"$_FOLDER/$_SMALL_IMG\" alt=\"\" style=\"width:${_SMALL_WIDTH}px; height:${_SMALL_HEIGHT}px\" srcset=\"$_FOLDER/$_SMALL_IMG 1x, $_FOLDER/$_RETINA_IMG 2x\" /></p>"

echo $_HTML


## EOF ##

