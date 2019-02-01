#!/bin/sh

hdmimode=`cat /sys/class/display/mode`;

# Set framebuffer geometry to match the resolution, splash should change according to the resolution. 
case $hdmimode in
  480*)            X=720  Y=480  SPLASH="/storage/.config/splash/splash-1080.png" ;;
  576*)            X=720  Y=576  SPLASH="/storage/.config/splash/splash-1080.png" ;;
  720p*)           X=1280 Y=720  SPLASH="/storage/.config/splash/splash-1080.png" ;;
  *)               X=1920 Y=1080 SPLASH="/storage/.config/splash/splash-1080.png" ;;
esac

# Set the variables
CFG="/storage/.emulationstation/es_settings.cfg"
SX05RELOG="/storage/sx05re.log"
PAT="s|\s*<string name=\"Sx05RE_$1_CORE\" value=\"\(.*\)\" />|\1|p"
EMU=$(sed -n "$PAT" "$CFG")

# Clear the log file
echo "Sx05RE Run Log" > $SX05RELOG

# if the emulator is in es_settings this is the line that will run 
RUNTHIS='/usr/bin/retroarch -L /tmp/cores/${EMU}_libretro.so "$2"'

# Else, read the first argument to see if its LIBRETRO, REICAST, MAME or PSP
case $1 in
"LIBRETRO")
   RUNTHIS='/usr/bin/retroarch -L /tmp/cores/$2_libretro.so "$3"'
         ;;
"REICAST")
   RUNTHIS='/usr/bin/reicast.sh "$2"'
         ;;
"ADVMAME")
   RUNTHIS='/usr/bin/advmame.sh "$2"'
         ;;
"PSP")
      if [ "$EMU" = "PPSSPPSA" ]; then
   #PPSSPP can run at 32BPP but only with buffered rendering, some games need non-buffered and the only way they work is if I set it to 16BPP
   /usr/bin/setres.sh 16
   RUNTHIS='/usr/bin/ppsspp.sh "$2"'
      fi
        ;;
esac


# Splash screen, not sure if this is the best way to do it, but it works so far, but not as good as I want it too with PPSSPPSDL and advmame :(
(
  fbi $SPLASH -noverbose > /dev/null 2>&1
)&

# Write the command to the log file.
echo "1st parameter: $1" >> $SX05RELOG 
echo "2nd Parameter: $2" >> $SX05RELOG 
echo "3rd Parameter: $3" >> $SX05RELOG 
echo "4th Parameter: $4" >> $SX05RELOG 
echo "Run Command is:" >> $SX05RELOG 
eval echo  ${RUNTHIS} >> $SX05RELOG 

# Exceute the command and try to output the results to the log file if it was not dissabled.
if [ "$3" == "NOLOG" ] || [ "$4" == "NOLOG" ]; then
   echo "Emulator log was dissabled" >> $SX05RELOG
   eval ${RUNTHIS}
else
   echo "Emulator Output is:" >> $SX05RELOG
   eval ${RUNTHIS} >> $SX05RELOG 2>&1
fi 

# Return to default mode
/usr/bin/setres.sh
