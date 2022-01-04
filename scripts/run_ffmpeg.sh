#!/usr/bin/env bash

#FFMPEG_PATH="./ffmpeg
FFMPEG_PATH="/usr/bin/ffmpeg"
FILE=media/arvo_pinwheels_20210412_171417.mp4
EXITFILE=status.txt
echo executing $FFMPEG_PATH $FILE
RET=`$FFMPEG_PATH -i $FILE out.mp4`
CODE=$?
echo RET $RET
echo CODE $CODE
echo $CODE > $EXITFILE


