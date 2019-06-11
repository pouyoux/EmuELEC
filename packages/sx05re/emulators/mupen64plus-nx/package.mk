# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2019-present Shanti Gilbert (https://github.com/shantigilbert)

PKG_NAME="mupen64plus-nx"
PKG_VERSION="96608bace2b9caf3fd5f7e685b2d3ce2add2ff0e"
PKG_SHA256="c208e4b33887635dcace82f6af9b6a81bfd9e305e845a0880242b44862cc6f53"
PKG_REV="1"
PKG_ARCH="arm"
PKG_LICENSE="GPLv2"
PKG_SITE="https://github.com/libretro/mupen64plus-libretro-nx"
PKG_URL="$PKG_SITE/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain nasm:host $OPENGLES"
PKG_SECTION="libretro"
PKG_SHORTDESC="mupen64plus + RSP-HLE + GLideN64 + libretro"
PKG_LONGDESC="mupen64plus + RSP-HLE + GLideN64 + libretro"
PKG_TOOLCHAIN="make"
PKG_BUILD_FLAGS="-lto"

PKG_MAKE_OPTS_TARGET+=" platform=amlogic GLES=1 FORCE_GLES=1 HAVE_NEON=1 WITH_DYNAREC=arm"

pre_make_target() { 
if [ ${PROJECT} = "Amlogic-ng" ]; then
	sed -i "s|-mcpu=cortex-a53 -mtune=cortex-a53|-mcpu=cortex-a73 -mtune=cortex-a73.cortex-a53|g" $PKG_BUILD/Makefile
fi 
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/lib/libretro
  cp mupen64plus_next_libretro.so $INSTALL/usr/lib/libretro/
}
