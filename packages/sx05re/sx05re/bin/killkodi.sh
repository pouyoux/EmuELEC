#!/bin/sh

    rm /var/lock/start.kodi
    systemctl stop kodi
  
 if pgrep -x "/usr/bin/emulationstation" > /dev/null
  then
    killall -9 emulationstation
  fi
  
 exit 0
