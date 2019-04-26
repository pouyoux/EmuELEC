#!/bin/sh

hdmimode=`cat /sys/class/display/mode`;
case $hdmimode in
  480*)            X=720  Y=480  SPLASH="/storage/.config/splash/loading-game.png" ;;
  576*)            X=720  Y=576  SPLASH="/storage/.config/splash/loading-game.png" ;;
  720p*)           X=1280 Y=720  SPLASH="/storage/.config/splash/loading-game.png" ;;
  *)               X=1920 Y=1080 SPLASH="/storage/.config/splash/loading-game.png" ;;
esac


SPLASH="/storage/.config/splash/loading-game.png"

if "$1" == "intro"; then
SPLASH="/storage/.config/splash/splash-1080.png"
fi 

(
if [ -e /proc/device-tree/mali@d00c0000/compatible ]; then
  mpv $SPLASH > /dev/null 2>&1
elif [ -e /proc/device-tree/t82x@d00c0000/compatible ]; then
  fbi $SPLASH -noverbose > /dev/null 2>&1
fi
)&
