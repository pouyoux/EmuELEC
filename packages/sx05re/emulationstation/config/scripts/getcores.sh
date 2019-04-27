#!/bin/bash

case "$1" in
"fba")
	echo "fbalpha,mame2003_plus"
	;;
"arcade")
	echo "mame2003_plus,mame2003,mame2003-midway,AdvanceMame,mame2010,mame2014"
	;;
"mame")
	echo "mame2003_plus,mame2003,mame2003-midway,AdvanceMame,mame2010,mame2014"
	;;
"psp")
	echo "PPSSPPSA,ppsspp"
	;;
"n64")
	echo "mupen64plus,parallel_n64,mupen64plus_next,M64P"
	;;
"nes")
	echo "nestopia,fceumm,quicknes"
	;;
"snes")
	echo "snes9x,snes9x2002,snes9x2005,snes9x2005_plus,snes9x2010"
	;;
"genesis")
	echo "genesis_plus_gx,picodrive"
	;;
"gba")
	echo "mgba,gpsp,vbam,vba-next"
	;;
"gbc")
	echo "gambatte,gearboy,tgbdual"
	;;
"amiga")
	echo "AMIBERRY,puae"
	;;
"dosbox")
	echo "dosbox,DOSBOXSDL2"
	;;
"dreamcast")
	echo "REICASTSA,reicast"
	;;
esac
