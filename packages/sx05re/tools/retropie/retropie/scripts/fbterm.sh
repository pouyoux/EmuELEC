#!/usr/bin/bash

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/emuelec/lib
export PATH=$PATH:/emuelec/bin

source /emuelec/scriptmodules/helpers.sh

fbterm "$1" -s 24 < /dev/tty1

joy2keyStop
