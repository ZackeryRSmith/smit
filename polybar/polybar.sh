#!/bin/bash

killall polybar 2>/dev/null
while pgrep -u $UID -x polybar > /dev/null; do sleep 1; done

export BAR_LABEL_SEPARATOR="%{T5}%{F$(xrdb -query | grep "*.color14" | cut -f 2)}%{F-}%{T-}"

polybar
