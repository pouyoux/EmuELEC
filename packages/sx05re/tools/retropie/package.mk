# SPDX-License-Identifier: GPL-3.0-or-later
# Copyright (C) 2019-present Team CoreELEC (https://coreelec.org)

PKG_NAME="retropie"
PKG_VERSION=""
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPLv2"
PKG_SITE=""
PKG_URL=""
PKG_DEPENDS_TARGET="toolchain bash pyudev dialog six fbterm git dbus-python pygobject coreutils"
PKG_SECTION="emuelec"
PKG_SHORTDESC="Retropie scripts"
PKG_LONGDESC="Retropie scripts adapted for emuELEC"
PKG_IS_ADDON="no"
PKG_AUTORECONF="no"
PKG_TOOLCHAIN="manual"

make_target() {
   
  mkdir -p $INSTALL/usr/config/emuelec/
    cp -rf $PKG_DIR/retropie/* $INSTALL/usr/config/emuelec/
    ln -sf /storage/.config/emuelec $INSTALL/emuelec
    find $INSTALL/usr/config/emuelec/ -type f -exec chmod o+x {} \;
   }
