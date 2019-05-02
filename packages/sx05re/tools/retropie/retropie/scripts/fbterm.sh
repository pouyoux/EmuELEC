#!/usr/bin/bash

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/emuelec/lib
export PATH=$PATH:/emuelec/bin

source /emuelec/scriptmodules/helpers.sh

if [ -e /proc/device-tree/t82x@d00c0000/compatible ]; then
/emuelec/scripts/setres.sh 16
fi

fbterm "$1" -s 24 < /dev/tty1

joy2keyStop
