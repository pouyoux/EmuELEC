#!/bin/sh

    touch /var/lock/start.games
    #systemctl start emustation
    cd /usr/bin/    
    rm /var/lock/start.kodi
    systemctl stop kodi
    /usr/bin/emustation-config
    /usr/bin/emulationstation




