#!/bin/sh

arguments="$@"

if [[ $arguments != *"KEEPMUSIC"* ]]; then
	if  pgrep mpg123 >/dev/null ; then
	/storage/.emulationstation/scripts/bgm.sh 
	fi
fi

/emuelec/scripts/show_splash.sh

# Set the variables
CFG="/storage/.emulationstation/es_settings.cfg"
EMUELECLOG="/storage/emuelec.log"
PAT="s|\s*<string name=\"EmuELEC_$1_CORE\" value=\"\(.*\)\" />|\1|p"
EMU=$(sed -n "$PAT" "$CFG")

# Clear the log file
echo "EmuELEC Run Log" > $EMUELECLOG

# if the emulator is in es_settings this is the line that will run 
RUNTHIS='/usr/bin/retroarch -v -L /tmp/cores/${EMU}_libretro.so "$2"'

# Else, read the first argument to see if its LIBRETRO, REICAST, MAME or PSP
case $1 in
"OPENBOR")
	RUNTHIS='/usr/bin/openbor.sh "$2"'
		;;
"RETROPIE")
	RUNTHIS='bash /retropie/scripts/fbterm.sh "$2"'
		;;
"LIBRETRO")
	RUNTHIS='/usr/bin/retroarch -v -L /tmp/cores/$2_libretro.so "$3"'
		;;
"REICAST")
	RUNTHIS='/usr/bin/reicast.sh "$2"'
		;;
"ADVMAME")
	RUNTHIS='/usr/bin/advmame.sh "$2"'
		;;
"DRASTIC")
	RUNTHIS='/storage/.emulationstation/scripts/drastic.sh "$2"'
		;;
"N64")
    if [ "$EMU" = "M64P" ]; then
	RUNTHIS='bash /usr/bin/m64p.sh "$2"'
	fi
		;;
"AMIGA")
    if [ "$EMU" = "AMIBERRY" ]; then
	RUNTHIS='bash /usr/bin/amiberry.start "$2"'
	fi
		;;
"DOSBOX")
    if [ "$EMU" = "DOSBOXSDL2" ]; then
	RUNTHIS='bash /usr/bin/dosbox.start "$2"'
	fi
		;;		
"PSP")
      if [ "$EMU" = "PPSSPPSA" ]; then
   #PPSSPP can run at 32BPP but only with buffered rendering, some games need non-buffered and the only way they work is if I set it to 16BPP
	/emuelec/scripts/setres.sh 16
   RUNTHIS='/usr/bin/ppsspp.sh "$2"'
      fi
        ;;
esac

# Write the command to the log file.
echo "1st parameter: $1" >> $EMUELECLOG 
echo "2nd Parameter: $2" >> $EMUELECLOG 
echo "3rd Parameter: $3" >> $EMUELECLOG 
echo "4th Parameter: $4" >> $EMUELECLOG 
echo "Run Command is:" >> $EMUELECLOG 
eval echo  ${RUNTHIS} >> $EMUELECLOG 

# TEMP: I need to figure out how to mix sounds, but for now make sure BGM is killed completely to free up the soundcard
if [[ $arguments != *"KEEPMUSIC"* ]]; then
	killall -9 mpg123 
fi

# Exceute the command and try to output the results to the log file if it was not dissabled.
if [[ $arguments != *"NOLOG"* ]]; then
   echo "Emulator Output is:" >> $EMUELECLOG
   eval ${RUNTHIS} >> $EMUELECLOG 2>&1
else
   echo "Emulator log was dissabled" >> $EMUELECLOG
   eval ${RUNTHIS}
fi 

if [[ $arguments != *"KEEPMUSIC"* ]]; then
	DEFE=$(sed -n 's|\s*<bool name="BGM" value="\(.*\)" />|\1|p' /storage/.emulationstation/es_settings.cfg)

	if [ "$DEFE" == "true" ]; then
	killall -9 mpg123
	/storage/.emulationstation/scripts/bgm.sh
	fi 
fi

# Return to default mode
/emuelec/scripts/setres.sh

# Only run resetfb if it exists, mainly for N2
if [ -f "/emuelec/scripts/resetfb.sh" ]; then
/emuelec/scripts/resetfb.sh
fi
