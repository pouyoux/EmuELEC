#!/bin/sh

    touch /var/lock/start.games
    #systemctl start emustation
    cd /usr/bin/    
    /usr/bin/emustation-config 
    /usr/bin/emulationstation &
    rm /var/lock/start.kodi
    systemctl stop kodi




