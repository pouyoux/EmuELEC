#!/bin/bash

. /storage/downloads/helpers.sh

export TERM="linux"
export TERMINFO="/usr/share/terminfo"
export HOME="/storage"
joy2keyStart
# dialog --yesno "Yes: Delete, No:  Restore" 7 60
# source "/storage/downloads/scriptmodules/system.sh"
# source "/storage/downloads/scriptmodules/packages.sh"

scriptdir="/storage/downloads"
 
source "$scriptdir/scriptmodules/system.sh"
source "$scriptdir/scriptmodules/helpers.sh"
source "$scriptdir/scriptmodules/inifuncs.sh"
source "$scriptdir/scriptmodules/packages.sh"
source "$scriptdir/scriptmodules/supplementary/esthemes.sh"

rp_registerAllModules

romdir="/storage/roms/" gui_esthemes
