#!/usr/bin/zsh

screen_width=$( xrandr | grep '*' | head -n 1 | awk '{ print $1 }' | cut -f 1 -d 'x' )

if [[ $1 == 'dmenu' ]]; then
  width=$(( $screen_width - 800 ))
fi

echo $width
