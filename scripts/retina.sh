#!/bin/sh

######
## Generates Retina and quarter size images for blogs
## 2018-01

_FUZZ=5
_TARGET_2X=1000
_COMMENT="From https://rubenerd.com/, Ruben's weblog of nerdish interests"
_FOLDER="https://rubenerd.com/files/`date +%Y`"
_SCP="rubenerd.com:`date +%Y`/"

set -e
set -x


## Check arguments and dependencies #######################################

if [ $# != 1 ]; then
    printf "%s\n" "Usage (and abusage): ./retina.sh [image]"
    exit 1
elif ! `command -v convert &> /dev/null`; then 
    printf "%s\n" "ImageMagick not found, exiting"
    exit 1
else
    _SRC=$1;
fi


## Create names ###########################################################

_FILE=`identify -ping -format %t $_SRC`
_EXT=`identify -ping -format %e $_SRC`
_2X_IMG="$_FILE@2x.$_EXT"
_1X_IMG="$_FILE@1x.$_EXT"


## Crop white space #######################################################

_QUALITY=`identify -ping -format "%Q" $_SRC`

convert               \
    -fuzz "${_FUZZ}%" \
    -trim             \
    +repage           \
    "$_SRC"           \
    -quality          \
    "$_QUALITY"       \
    "$_2X_IMG"


## Get cropped image attributes ###########################################

_2X_WIDTH=`identify -ping -format %w $_2X_IMG`
_2X_HEIGHT=`identify -ping -format %h $_2X_IMG`


## Shrink image if too wide for retina ####################################

if [ $_2X_WIDTH -gt $_TARGET_2X ]; then
    _2X_WIDTH=$_TARGET_2X

    mogrify                   \
        -resize ${_2X_WIDTH}!x \
        -comment "$_COMMENT"  \
        -quality $_QUALITY    \
        "$_2X_IMG"            

    	_2X_HEIGHT=`identify -ping -format %h $_2X_IMG`
        echo "Fucking new height: $_2X_HEIGHT"
fi


## Crop if not /2 (Retina has to be double) ###############################

_NEEDS_CROPPING="NO"

#if expr $_2X_HEIGHT % 2 &> /dev/null; then
if ! `expr $_2X_HEIGHT % 2`; then
    _2X_HEIGHT=`expr $_2X_HEIGHT - 1`
    _NEEDS_CROPPING="YES"
fi

if ! `expr $_2X_WIDTH % 2`; then
    _2X_WIDTH=`expr $_2X_WIDTH - 1`
    _NEEDS_CROPPING="YES"
fi

if [ $_NEEDS_CROPPING == "YES" ]; then
    mogrify                                    \
        -crop ${_2X_WIDTH}!x${_2X_HEIGHT}!+0+0 \
	+repage                                    \
        "$_2X_IMG" 
fi


## Create 1x image ########################################################

_1X_WIDTH=`expr $_2X_WIDTH / 2`
_1X_HEIGHT=`expr $_2X_HEIGHT / 2`


convert                                  \
    "$_2X_IMG"                           \
    -comment "$_COMMENT"                 \
    -resize ${_1X_WIDTH}!x${_1X_HEIGHT}! \
    -quality "97"                        \
    "$_1X_IMG"


## Optimise images ########################################################

case "$_EXT" in
    jpg)
        jpegoptim --all-progressive "$_2X_IMG" "$_1X_IMG"
	;;
    png)
        pngcrush -brute -reduce -ow -v "$_2X_IMG"
        pngcrush -brute -reduce -ow -v "$_1X_IMG"
	;;
    gif)
	# TODO: Handle GIFs!
esac


## Generate HTML ##########################################################

_HTML="<p><img src=\"$_FOLDER/$_1X_IMG\" alt=\"\" style=\"width:${_1X_WIDTH}px; height:${_1X_HEIGHT}px\" srcset=\"$_FOLDER/$_1X_IMG 1x, $_FOLDER/$_2X_IMG 2x\" /></p>"


## Upload! ################################################################

scp "$_2X_IMG" "$_1X_IMG" "$_SCP"

echo $_HTML | pbcopy


## EOF ##

