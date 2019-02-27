# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present CoreELEC (https://coreelec.org)

PKG_NAME="es-theme-simple-dark"
PKG_VERSION="4c33193cb3efd55b2631d856b9799e4841c3da8f"
PKG_SHA256="07f2cc90a2966c1f66a799c6d8171401f547474f3d95db1838d67e2a1ab20bb9"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/RetroPie/es-theme-simple-dark"
PKG_URL="$PKG_SITE/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_SECTION="sx05re"
PKG_SHORTDESC="Simple dark theme for Emulationstation"
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
