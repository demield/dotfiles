#!/bin/sh

PIPE_FILE="/tmp/pipe.xob"
pkill "tail -f $PIPE_FILE | xob"
rm $PIPE_FILE

mkfifo $PIPE_FILE
tail -f $PIPE_FILE | xob

