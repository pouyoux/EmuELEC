#!/bin/sh

if [ "$1" == "intro" ]; then
	SPLASH="/storage/.config/splash/splash-1080.png"
else
	SPLASHDIR="/storage/overlays/splash"
	#ZIPDIR="$2"
	#ROMNAME="${2##*/}"
	#ROMNAME="${ROMNAME%.*}"
	ROMNAME=$(basename ${2%.*})
	SPLMAP="$SPLASHDIR/splashmap.cfg"
	SPLNAME=$(sed -n "/`echo ""$1"_"${ROMNAME}" = "`/p" "$SPLMAP")
	REALSPL="${SPLNAME#*\"}"
	REALSPL="${REALSPL%\"*}"
	SPLASH1="$SPLASHDIR/$1/$REALSPL.png"
	SPLASH2="$SPLASHDIR/$1/$ROMNAME.png"
	SPLASH3="$SPLASHDIR/$1/splash.png"
if [ -f $SPLASH1 ]; then
	SPLASH=$SPLASH1
elif [ -f $SPLASH2 ]; then
	SPLASH=$SPLASH2
elif [ -f $SPLASH3 ]; then
	SPLASH=$SPLASH3
else
	SPLASH="/storage/.config/splash/loading-game.png"
fi

# hdmimode=`cat /sys/class/display/mode`;
# case $hdmimode in
#  480*)            X=720  Y=480  SPLASH="/storage/.config/splash/loading-game.png" ;;
#  576*)            X=720  Y=576  SPLASH="/storage/.config/splash/loading-game.png" ;;
#  720p*)           X=1280 Y=720  SPLASH="/storage/.config/splash/loading-game.png" ;;
#  *)               X=1920 Y=1080 SPLASH="/storage/.config/splash/loading-game.png" ;;
# esac

SPLASH="/storage/.config/splash/loading-game.png"
fi 

(
if [ -e /proc/device-tree/mali@d00c0000/compatible ]; then
  mpv $SPLASH > /dev/null 2>&1
elif [ -e /proc/device-tree/t82x@d00c0000/compatible ]; then
  fbi $SPLASH -noverbose > /dev/null 2>&1
fi
)&
