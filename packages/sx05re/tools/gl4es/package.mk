# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2019-present CoreELEC (https://coreelec.org)

PKG_NAME="gl4es"
PKG_VERSION="7ece2d8c61fd40416208e6305eb6ea939200ca39"
PKG_SHA256=""
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/ptitSeb/gl4es"
PKG_URL="$PKG_SITE/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="gl4es"
PKG_TOOLCHAIN="cmake-make"

make_target() {
cmake . -DODROID=1 
make GL
}

makeinstall_target() {
PKG_LIBNAME="libGL.so"
PKG_LIBPATH="$PKG_BUILD/.armv8a-libreelec-linux-gnueabi/lib/libGL.so.1"
PKG_LIBVAR="GL"

  mkdir -p $INSTALL/usr/lib
  cp $PKG_LIBPATH $SYSROOT_PREFIX/usr/lib/$PKG_LIBNAME
  cp $PKG_LIBPATH $INSTALL/usr/lib
  
}
