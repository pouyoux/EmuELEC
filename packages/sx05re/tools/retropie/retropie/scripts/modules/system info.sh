#!/bin/bash

source /emuelec/scripts/env.sh
source "$scriptdir/scriptmodules/supplementary/systeminfo.sh"
rp_registerAllModules

joy2keyStart
gui_systeminfo
