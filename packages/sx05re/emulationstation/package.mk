# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present CoreELEC (https://coreelec.org)

PKG_NAME="emulationstation"
PKG_VERSION="a466e0d"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/RetroPie/EmulationStation"
PKG_URL="$PKG_SITE.git"
PKG_DEPENDS_TARGET="toolchain SDL2-git freetype curl freeimage vlc bash"
PKG_SECTION="sx05re"
PKG_SHORTDESC="Emulationstation emulator frontend"
PKG_BUILD_FLAGS="-gold"
GET_HANDLER_SUPPORT="git"

# theme for Emulationstation
#PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET emulationstation-theme-simple-dark"
#PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET emulationstation-theme-carbon"
#PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET emulationstation-theme-nes-mini"
#PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET emulationstation-theme-tronkyfran"
#PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET emulationstation-theme-crt"
PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET emulationstation-theme-ComicBook"

post_makeinstall_target() {

  mkdir -p $INSTALL/usr/bin/resources
    cp -rf $PKG_BUILD/resources/* $INSTALL/usr/bin/resources/

   mkdir -p $INSTALL/etc/emulationstation/
   ln -sf /storage/.config/emulationstation/themes $INSTALL/etc/emulationstation/
   
   mkdir -p $INSTALL/usr/config/emulationstation
    cp $PKG_DIR/config/* $INSTALL/usr/config/emulationstation
}


post_install() {  
# Thanks to vpeter we can now have bash :) 
  rm -f $INSTALL/usr/bin/{sh,bash,busybox}
  cp $(get_build_dir busybox)/.install_pkg/usr/bin/busybox $INSTALL/usr/bin
  cp $(get_build_dir bash)/.install_pkg/usr/bin/bash $INSTALL/usr/bin
  ln -sf bash $INSTALL/usr/bin/sh
 
  echo "chmod 4755 $INSTALL/usr/bin/bash" >> $FAKEROOT_SCRIPT
  echo "chmod 4755 $INSTALL/usr/bin/busybox" >> $FAKEROOT_SCRIPT
  
  enable_service emustation.service
}
