#!/bin/bash
TMPBG=/tmp/screen.png
LOCK=~/.config/i3/res/lock.png
RES=$(xrandr | grep 'current' | sed -E 's/.*current\s([0-9]+)\sx\s([0-9]+).*/\1x\2/')
 
ffmpeg -f x11grab -video_size $RES -y -i $DISPLAY -i $LOCK -filter_complex "boxblur=10:2,overlay=(main_w-overlay_w)/2:(main_h-overlay_h)/2" -vframes 1 $TMPBG -loglevel quiet

i3lock -n -i $TMPBG \
    --inside-color=373445ff --ring-color=ffffffff --line-uses-inside \
    --keyhl-color=d23c3dff --bshl-color=d23c3dff --separator-color=00000000 \
    --insidever-color=fecf4dff --insidewrong-color=d23c3dff \
    --ringver-color=ffffffff --ringwrong-color=ffffffff --ind-pos="x+34:y+725" \
    --radius=15 --verif-text="" --wrong-text="" 

rm $TMPBG
