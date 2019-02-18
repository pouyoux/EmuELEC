#!/bin/sh
    touch /var/lock/start.games
    systemctl start emustation
    killkodi.sh > /dev/null 2>&1
