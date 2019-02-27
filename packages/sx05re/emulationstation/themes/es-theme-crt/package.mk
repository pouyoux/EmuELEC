# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present CoreELEC (https://coreelec.org)

PKG_NAME="es-theme-crt"
PKG_VERSION="dd918d0547be4fcf978bf7133625ebcd18800bae"
PKG_SHA256="764100ed3ee68709b806888a067a247b1b604d27683c3f82de960a1198c7653a"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/anthonycaccese/es-theme-crt"
PKG_URL="$PKG_SITE/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_SECTION="sx05re"
PKG_SHORTDESC="CRT theme for Emulationstation"
PKG_IS_ADDON="no"
PKG_AUTORECONF="no"
PKG_TOOLCHAIN="manual"

make_target() {
  : not
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/config/emulationstation/themes/$PKG_NAME
    cp -r * $INSTALL/usr/config/emulationstation/themes/$PKG_NAME
}
