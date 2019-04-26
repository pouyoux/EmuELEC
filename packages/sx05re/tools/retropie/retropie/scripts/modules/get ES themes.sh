#!/bin/bash

source /emuelec/scripts/env.sh
source "$scriptdir/scriptmodules/supplementary/esthemes.sh"
rp_registerAllModules

joy2keyStart
romdir="/storage/roms/" gui_esthemes
