#!/bin/sh

######
## Creates, formats and uploads new podcast episodes
## For Rubénerd Show and Snake Tea Podcast
## 
## 2015-07-27: Created

set -e


###########################################################
## Configuration and variables

## Required for processing
_bucket='~/Repositories/rubenerd-hugo/bucket/'
_date_fmt='%Y-%m-%dT%H:%M:%S%z';

## Default show attributes (will be asked for)
_show='Rubénerd Show'
_host='Ruben Schade'
_licence='http://creativecommons.org/licenses/by/3.0/'
_location='Sydney, Australia'

## Individual episode attributes (will be asked for)
_number=0;
_description='';
_date='';
_file_size=0;
_duration='00:00';

## Derived attributes (built from previous) 
_onsug_release_date=''  ## "Released July 2015 on Onsug.."
_onsug_title_date=''    ## "Show 21 (7/12/15)"


###########################################################
## Function to ask question, compare to default

function ask() {
    _question=$1
    _default=$2

    read -p "$_question ($_default): " _in
    [ -n "$_in" ] && _default=$_in
    echo $_default
    return 0
}

###########################################################
## Script

## Splash screen!
clear
echo "Ruben's and Clara's Podcast Generator 5000!"
echo "==========================================="
echo

## Get curent date and time 
_date=`date +"$_date_fmt" | sed 's/00$/:00/'`

## Ask for details
_show=`ask "Name of the show" "$_show"`
_host=`ask "Host of the show" "$_host"`
_number=`ask "Episode number" "$_number"`
_date=`ask "Release date" "$_date"`
_location=`ask "Location" "$_location"`
_licence=`ask "Licence" "$_licence"`
read -p "Show description, in one line: " _description 

###########################################################

exit 0
