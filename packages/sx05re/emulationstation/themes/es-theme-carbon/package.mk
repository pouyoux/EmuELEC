# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present CoreELEC (https://coreelec.org)

PKG_NAME="es-theme-carbon"
PKG_VERSION="37413452b33497385c314b4d630d1b1ccafbb7d6"
PKG_SHA256="60e693c55929a43a65b64af006e7ce84e91f69ade650d28530e107c8463c1c44"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/RetroPie/es-theme-carbon"
PKG_URL="$PKG_SITE/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_SECTION="sx05re"
PKG_SHORTDESC="Carbon theme for Emulationstation"
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
