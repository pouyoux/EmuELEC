#!/bin/bash

source /retropie/scripts/env.sh
source "$scriptdir/scriptmodules/supplementary/skyscraper.sh"
rp_registerAllModules

joy2keyStart
romdir="/storage/roms/" gui_skyscraper
