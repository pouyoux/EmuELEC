#!/usr/bin/bash

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/retropie/lib
export PATH=$PATH:/retropie/bin

source /retropie/scriptmodules/helpers.sh

fbterm $1 -s 24 < /dev/tty1

joy2keyStop
