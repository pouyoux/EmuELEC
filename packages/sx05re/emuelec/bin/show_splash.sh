#!/bin/sh

# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2019-present SumavisionQ5 (https://github.com/SumavisionQ5)
# Modifications by Shanti Gilbert (https://github.com/shantigilbert)

if [ "$1" == "intro" ]; then
	SPLASH="/storage/.config/splash/splash-1080.png"
else
	SPLASHDIR="/storage/overlays/splash"
	ROMNAME=$(basename ${2%.*})
	SPLMAP="/emuelec/bezels/arcademap.cfg"
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

SPLASH="/storage/.config/splash/loading-game.png"
fi 

(
# it seems the Odroid N2 does not like mpv either...
#if [ -e /proc/device-tree/t82x@d00c0000/compatible ]; then
	fbi $SPLASH -noverbose > /dev/null 2>&1
#else
	#mpv $SPLASH > /dev/null 2>&1
#fi
)&
