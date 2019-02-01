#!/bin/sh
IP="$(ifconfig eth0 | grep 'inet addr' | cut -d: -f2 | awk '{print $1}')"
 if [ -z "$IP" ]; then
    echo "No Internet"
else
    echo ${IP}
fi
