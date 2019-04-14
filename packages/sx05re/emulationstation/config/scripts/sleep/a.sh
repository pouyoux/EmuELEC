#!/bin/bash

DEFE=$(sed -n 's|\s*<bool name="BGM" value="\(.*\)" />|\1|p' /storage/.emulationstation/es_settings.cfg)

	if [ "$DEFE" == "true" ]; then
	    if  pgrep mpg123 >/dev/null ; then
	/storage/.emulationstation/scripts/bgm.sh 
	    fi
	fi 
