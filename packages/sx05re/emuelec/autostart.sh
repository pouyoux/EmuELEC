#!/bin/sh

# It seems some slow SDcards have a problem creating the symlink on time :/
CONFIG_DIR="/storage/.emulationstation"
CONFIG_DIR2="/storage/.config/emulationstation"

if [ ! -L "$CONFIG_DIR" ]; then
ln -sf $CONFIG_DIR2 $CONFIG_DIR
fi

# Clean cache garbage when boot up.
rm -rf /storage/.cache/cores/*

# Overclocking? 
echo "performance" > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
# echo "performance" > /sys/devices/system/cpu/cpu4/cpufreq/scaling_governor
echo 5 > /sys/class/mpgpu/cur_freq

# Is BMG enabled? then start the music
if [ -f /storage/.emulationstation/es_settings.cfg ]; then

DEFE=$(sed -n 's|\s*<string name="EmuELEC_BGM_BOOT" value="\(.*\)" />|\1|p' $CONFIG_DIR/es_settings.cfg)

case "$DEFE" in
"Yes")
	killall mpg123
	/storage/.emulationstation/scripts/bgm.sh
	sed -i -e "s/name=\"BGM\" value=\"false\"/name=\"BGM\" value=\"true\"/" $CONFIG_DIR/es_settings.cfg
	;;
"No")
	killall mpg123
	sed -i -e "s/name=\"BGM\" value=\"true\"/name=\"BGM\" value=\"false\"/" $CONFIG_DIR/es_settings.cfg
	;;
esac

fi

# handle SSH
DEFE=$(sed -n 's|\s*<bool name="SSH" value="\(.*\)" />|\1|p' $CONFIG_DIR/es_settings.cfg)

    mkdir -p /storage/.cache/services/
    touch /storage/.cache/services/sshd.conf

case "$DEFE" in
"true")
	systemctl start sshd
	;;
"false")
	systemctl stop sshd
	;;
esac

# What to start at boot?
DEFE=$(sed -n 's|\s*<string name="EmuELEC_BOOT" value="\(.*\)" />|\1|p' $CONFIG_DIR/es_settings.cfg)

rm -rf /var/lock/start.retro
rm -rf /var/lock/start.games
	
case "$DEFE" in
"Retroarch")
	touch /var/lock/start.retro
	systemctl start retroarch
	;;
*)
	/usr/bin/startfe.sh &
	;;
esac

# Bluetooth, Make sure you change your BT MAC address, you need to do this by SSH the first time
# by running 

# hcitool scan
# bluetoothctl pair yourmac
# bluetoothctl trust yourmac 

# If you want to use bluetooth, uncomment every line after this one 

# BTMAC="E4:17:D8:8B:F1:80"
# (
# echo "agent on" | bluetoothctl
# echo "default-agent" | bluetoothctl
# echo "power on" | bluetoothctl
# echo "discoverable on" | bluetoothctl
# echo "pairable on" | bluetoothctl
# echo "scan on" | bluetoothctl
# echo "trust $BTMAC" | bluetoothctl
# echo "connect $BTMAC" | bluetoothctl
# )&
