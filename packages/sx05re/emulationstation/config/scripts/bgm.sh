#!/bin/bash

BGMPATH="/storage/roms/BGM/*.mp3"

if pgrep mpg123 >/dev/null
then
echo "Killing BGM"
    killall mpg123
else
echo "Starting BGM"
   systemd-run mpg123 -r 32000 -Z $BGMPATH
fi
