#!/bin/sh

# Clean cache garbage when boot up.
rm -rf /storage/.cache/cores/*

# temp dissable CE autoupdate.
if [ ! -f "/storage/.kodi/userdata/addon_data/service.coreelec.settings/oe_settings.xml" ]; then
mkdir -p /storage/.kodi/userdata/addon_data/service.coreelec.settings/
cp /usr/config/nau/oe_settings.xml /storage/.kodi/userdata/addon_data/service.coreelec.settings/oe_settings.xml
fi 

# temp I need to find out why the retroarch.cfg is not being copied witouth this line
# if [ ! -f "/storage/.config/retroarch/retroarch.cfg" ]; then
# mkdir -p /storage/.config/retroarch
# cp /etc/retroarch.cfg /storage/.config/retroarch/retroarch.cfg
# fi 


# Overclocking? 
echo "performance" > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
echo "performance" > /sys/devices/system/cpu/cpu4/cpufreq/scaling_governor

echo 5 > /sys/class/mpgpu/cur_freq

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
*)
	rm -rf /var/lock/start.kodi
	rm -rf /var/lock/start.retro
	/usr/bin/startfe.sh &
	;;
esac
