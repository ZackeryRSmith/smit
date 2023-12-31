#!/bin/env bash

##############
# gifbg.sh ###########################
#    ~ the ram eating gif wallpapers #
######################################

# command to set wallpaper
prog='feh --bg-fill --no-fehbg '

[ "$#" -lt "1" ] || [ "$#" -gt "2" ] && {  echo -e "ERROR : args number invalid" ; exit 1 ; }
dir=/tmp/gifbg
speed=$1
name=$2

[[ "$name" == "" ]] && { name=$speed ; speed=${name##*-} ; }

[ ! -f "$name" ] && { echo "file not found" ; exit 1 ; }
hash=`md5sum $name | cut -f1 -d" "`

[[ ! -d $dir ]] && mkdir $dir 

[[ ! -d $dir/$hash ]] && { mkdir $dir/$hash ; echo "spliting .." ; convert -coalesce $name $dir/$hash/$hash.png ; echo done ; }

# if speed is set to auto
if [ "$1" == "auto" ]; then
    frames=($(ls -v "$dir/$hash"))
    amount_of_frames=${#frames[@]}
    frames_per_second=30
    speed=$(bc <<< "scale=3; ($amount_of_frames/$frames_per_second) * (1/$frames_per_second)")
fi

while : ; do for i in ` ls $dir/$hash -v ` ; do $prog$dir/$hash/$i ; sleep $speed ; done ; done    

