#!/bin/bash

directory=~/Pictures/wallpapers
monitor=`hyprctl monitors | grep Monitor | awk '{print $2}'`

if [ -d "$directory" ]; then
  random_background=$(ls $directory/* | shuf -n 1)

  hyprctl hyprpaper unload all
  hyprctl hyprpaper preload $random_background
  hyprctl hyprpaper wallpaper ", $random_background"

  echo "New wallpaper: "$random_background

fi
