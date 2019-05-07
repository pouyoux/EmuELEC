#!/bin/sh

# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2019-present SumavisionQ5 (https://github.com/SumavisionQ5)
# Modifications by Shanti Gilbert (https://github.com/shantigilbert)

if [ "$1" == "intro" ]; then
	SPLASH="/storage/.config/splash/splash-1080.png"
else
	SPLASHDIR="/storage/overlays/splash"
	ROMNAME=$(basename "${2%.*}")
	SPLMAP="/emuelec/bezels/arcademap.cfg"
	SPLNAME=$(sed -n "/`echo ""$1"_"${ROMNAME}" = "`/p" "$SPLMAP")
	REALSPL="${SPLNAME#*\"}"
	REALSPL="${REALSPL%\"*}"
[ ! -z "$REALSPL" ] && SPLASH1=$(find $SPLASHDIR/$1 -iname "$REALSPL".png -maxdepth 1 | head -n 1)
[ ! -z "$ROMNAME" ] && SPLASH2=$(find $SPLASHDIR/$1 -iname "$ROMNAME"*.png -maxdepth 1 | head -n 1)
	
	SPLASH3="$SPLASHDIR/$1/splash.png"
	
if [ -f "$SPLASH1" ]; then
	SPLASH=$SPLASH1
elif [ -f "$SPLASH2" ]; then
	SPLASH=$SPLASH2
elif [ -f "$SPLASH3" ]; then
	SPLASH=$SPLASH3
else
	SPLASH="/storage/.config/splash/loading-game.png"
fi
fi 
(
	fbi $SPLASH -noverbose > /dev/null 2>&1
)&
