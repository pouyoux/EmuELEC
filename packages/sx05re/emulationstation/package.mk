# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present CoreELEC (https://coreelec.org)

PKG_NAME="emulationstation"
PKG_VERSION="9d793dbbc40f0aa700cc77eb58c0f3fc72a25415"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/RetroPie/EmulationStation"
PKG_URL="$PKG_SITE.git"
PKG_DEPENDS_TARGET="toolchain SDL2-git freetype curl freeimage vlc bash rapidjson ${OPENGLES}"
PKG_SECTION="emuelec"
PKG_NEED_UNPACK="busybox"
PKG_SHORTDESC="Emulationstation emulator frontend"
PKG_BUILD_FLAGS="-gold"
GET_HANDLER_SUPPORT="git"

if [ ${PROJECT} = "Amlogic-ng" ]; then
  PKG_PATCH_DIRS="${PROJECT}"
fi


# themes for Emulationstation
#PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET es-theme-simple-dark"
#PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET es-theme-carbon"
#PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET es-theme-nes-mini"
#PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET es-theme-tronkyfran"
#PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET es-theme-crt"
#PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET es-theme-Chicuelo"
#PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET es-theme-pixel"
#PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET es-theme-Retrorama"
PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET es-theme-ComicBook"

post_makeinstall_target() {

  mkdir -p $INSTALL/usr/bin/resources
    cp -rf $PKG_BUILD/resources/* $INSTALL/usr/bin/resources/

   mkdir -p $INSTALL/etc/emulationstation/
   ln -sf /storage/.config/emulationstation/themes $INSTALL/etc/emulationstation/
   
   mkdir -p $INSTALL/usr/config/emulationstation
    cp -rf $PKG_DIR/config/* $INSTALL/usr/config/emulationstation
    chmod +x $INSTALL/usr/config/emulationstation/scripts/*
    chmod +x $INSTALL/usr/config/emulationstation/scripts/configscripts/*
    find $INSTALL/usr/config/emulationstation/scripts/ -type f -exec chmod o+x {} \; 
	
	if [ ${PROJECT} = "Amlogic-ng" ]; then    
	sed -i "s|-r 32000 -Z|-Z|" $INSTALL/usr/config/emulationstation/scripts/bgm.sh
	fi
}

post_install() {  
  enable_service emustation.service
}
