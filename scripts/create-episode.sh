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
## Script

## Splash screen!
clear
echo "Ruben's and Clara's Podcast Generator 5000!"
echo "==========================================="
echo

## Get curent date and time 
_date=`date +"$_date_fmt" | sed 's/00$/:00/'`

## Ask for details
read -p "Name of the show ($_show): " _in
[ -n "$_in" ] && _show=$_in

read -p "Host of the show ($_host): " _in
[ -n "$_in" ] && _host=$_in

read -p "Episode number ($_number): " _in
[ -n "$_in" ] && _number=$_in

read -p "Release date ($_date): " _in
[ -n "$_in" ] && _date=$_in

read -p "Description: " _description

read -p "Licence ($_licence): " _in
[ -n "$_in" ] && _licence=$_in
