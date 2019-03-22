#!/bin/bash

export TERM="linux"
export TERMINFO="/usr/share/terminfo"
export TERMINFO_DIRS=$TERMINFO
export HOME="/storage"

scriptdir="/retropie"
source "$scriptdir/scriptmodules/system.sh"
source "$scriptdir/scriptmodules/helpers.sh"
source "$scriptdir/scriptmodules/inifuncs.sh"
source "$scriptdir/scriptmodules/packages.sh"
source "$scriptdir/scriptmodules/supplementary/esthemes.sh"

rp_registerAllModules

joy2keyStart
romdir="/storage/roms/" gui_esthemes
