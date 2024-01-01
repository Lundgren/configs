#!/bin/bash

if [ -f "$HOME/configs/wallpaper.jpg" ]; then
    WALLPAPER="$HOME/configs/wallpaper.jpg"
elif [ -f "$HOME/configs/wallpaper.png" ]; then
    WALLPAPER="$HOME/configs/wallpaper.png"
else
    echo "No wallpaper found."
    exit 1
fi

feh --bg-scale "$WALLPAPER"