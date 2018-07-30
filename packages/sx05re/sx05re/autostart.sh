#!/bin/sh
# USB roms 
# sleep 2

# Clean cache garbage when boot up.
rm -rf /storage/.cache/cores/*


DEFE=$(sed -n 's|\s*<string name="Sx05RE_BOOT" value="\(.*\)" />|\1|p' /storage/.emulationstation/es_settings.cfg)

case "$DEFE" in
"Retroarch")
	rm -rf /var/lock/start.kodi
	rm -rf /var/lock/start.games
	touch /var/lock/start.retro
	systemctl start retroarch
	;;
"Kodi")
	rm -rf /var/lock/start.retro
	rm -rf /var/lock/start.games
	touch  /var/lock/start.kodi
	;;
"Emulationstation")
	rm -rf /var/lock/start.kodi
	rm -rf /var/lock/start.retro
	/usr/bin/startfe.sh &
	;;
esac
