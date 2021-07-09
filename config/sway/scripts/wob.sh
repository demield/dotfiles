#!/bin/sh

source $HOME/.config/themes/Pop-dark/colors.sh

pkill "tail -f $SWAYSOCK.wob | wob"
rm $SWAYSOCK.wob

BACKGROUND_COLOR=$(echo "$BACKGROUND" | sed 's/#/#FF/')
COLOR=$(echo "$BRIGHT_CYAN" | sed 's/#/#FF/')

mkfifo $SWAYSOCK.wob
tail -f $SWAYSOCK.wob | wob \
  -W 192 -H 16 -b 2 -p 0 -o 0 \
  --border-color $COLOR \
  --background-color $BACKGROUND_COLOR \
  --bar-color $COLOR

