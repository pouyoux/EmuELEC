#!/bin/sh

case $1 in
"EMUS")
systemctl stop emustation
rm -rf /storage/.config/emulationstation/es_settings.cfg
rm -rf /storage/.config/emulationstation/es_systems.cfg
rm -rf /storage/.config/emulationstation/scripts/*
rm -rf /emuelec/*
rm -rf /storage/.local*
rm -rf /storage/.config/ppsspp*
rm -rf /storage/.config/reicast*
rm -rf /storage/.config/retroarch*
rm -rf /storage/.advance*
systemctl reboot
  ;;
"ALL")
systemctl stop emustation
rm -rf /storage/.*
systemctl reboot
  ;;
esac
