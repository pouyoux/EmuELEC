#!/bin/bash

if [ ! -L "/storage/.skyscraper" ]
ln -sTf /storage/.config/skyscraper /storage/.skyscraper
fi

source /retropie/scripts/env.sh
source "$scriptdir/scriptmodules/supplementary/skyscraper.sh"
rp_registerAllModules

joy2keyStart

function scrape_confirm() {
     if dialog --yesno "This will Kill Emulationstation and will Skyscraper, do you want to continue?"  22 76 >/dev/tty; then
		start_skyscraper
      fi
 }

function start_skyscraper() {
systemd-run bash /retropie/scripts/fbterm.sh /retropie/scripts/modules/Skyscraper.start
systemctl stop emustation
}

scrape_confirm
