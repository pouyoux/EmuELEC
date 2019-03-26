#!/bin/bash

export TERM="linux"
export TERMINFO="/usr/share/terminfo"
export TERMINFO_DIRS=$TERMINFO
export HOME="/storage"
export romdir="/storage/roms/"
export configdir="/storage/.config/retropie/configs"
export scriptdir="/retropie"
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/retropie/lib
export PATH=$PATH:/retropie/bin

rootdir="/retropie"
home="/storage"
datadir="$home/.config/retropie/RetroPie"
romdir="$home/roms"
biosdir="$romdir/BIOS"
emudir="$rootdir/emulators"
configdir="$rootdir/configs"
__logdir="$scriptdir/logs"
__tmpdir="/tmp"
__builddir="$__tmpdir/build"
__swapdir="$__tmpdir"
__backtitle="EmuELEC - RetroPie configuration"

source "$scriptdir/scriptmodules/system.sh"
source "$scriptdir/scriptmodules/helpers.sh"
source "$scriptdir/scriptmodules/inifuncs.sh"
source "$scriptdir/scriptmodules/packages.sh"
