#!/bin/bash

source /emuelec/scripts/env.sh
source "$scriptdir/scriptmodules/supplementary/reicast.sh"
rp_registerAllModules

joy2keyStart
gui_reicast
