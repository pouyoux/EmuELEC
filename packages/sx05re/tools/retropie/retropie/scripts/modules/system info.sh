#!/bin/bash

source /retropie/scripts/env.sh
source "$scriptdir/scriptmodules/supplementary/systeminfo.sh"
rp_registerAllModules

joy2keyStart
gui_systeminfo
