#!/bin/sh

 if pgrep -x "/usr/bin/emulationstation" > /dev/null
  then
    killall -9 emulationstation
  fi

 exit 0
