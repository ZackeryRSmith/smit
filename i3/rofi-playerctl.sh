#!/bin/env bash

status="$(playerctl status -f "{{playerName}}"): $(playerctl metadata -f "{{title}} by {{artist}}")"

# options (nerdfont for icons)
toggle="󰐎 Play/Pause"
next="󰒭 Next"
prev="󰒮 Previous"
seekminus="󰒫 Go back 15 seconds"
seekplus="󰒬 Go ahead 15 seconds"
switch="󰥠 Change selected player"

# Variable passed to rofi
options="$toggle\n$next\n$prev\n$seekplus\n$seekminus\n$switch"

chosen="$(echo -e "$options" | rofi -show -p "$status" -dmenu -selected-row 0)"
case $chosen in
    $toggle)
		playerctl play-pause
        ;;
    $next)
		playerctl next
        ;;
    $prev)
        playerctl previous
        ;;
    $seekminus)
		playerctl position 15-
        ;;
    $seekplus)
		playerctl position 15+
        ;;
    $switch)
        playerctld shift
        ;;
esac
