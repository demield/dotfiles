#!/bin/sh

source $HOME/.config/themes/Pop-dark/colors.sh

pkill "tail -f $SWAYSOCK.wob | wob"
rm $SWAYSOCK.wob

mkfifo $SWAYSOCK.wob
tail -f $SWAYSOCK.wob | wob \
  -W 192 -H 16 -b 2 -p 0 -o 0 \
  --border-color ${BRIGHT_CYAN}FF \
  --background-color ${BACKGROUND}FF \
  --bar-color ${BRIGHT_CYAN}FF

