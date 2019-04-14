#!/bin/bash

DEFE=$(sed -n 's|\s*<bool name="BGM" value="\(.*\)" />|\1|p' /storage/.emulationstation/es_settings.cfg)

	if [ "$DEFE" == "true" ]; then
	killall mpg123
	/storage/.emulationstation/scripts/bgm.sh
	fi 
