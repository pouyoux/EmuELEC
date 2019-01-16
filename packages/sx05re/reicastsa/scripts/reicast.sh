#!/bin/sh

#set reicast BIOS dir to point to /storage/roms/bios
if [ ! -L /storage/.local/share/reicast/data ]; then
	mkdir -p /storage/.local/share/reicast 
	rm -rf /storage/.local/share/reicast/data
	ln -s /storage/roms/bios/dc /storage/.local/share/reicast/data
fi

if [ ! -d /storage/.local/share/reicast/mappings ]; then
mkdir -p /storage/.local/share/reicast/mappings
cp -r /storage/.config/reicast/mappings/* /storage/.local/share/reicast/mappings
fi

/usr/bin/reicast "$1"

 
