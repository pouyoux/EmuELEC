# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2019-present Team CoreELEC (https://coreelec.org)

PKG_NAME="neocd_libretro"
PKG_VERSION="f1e188f5409ae6296a511e173ee1990174327e02"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="LGPLv3.0"
PKG_SITE="https://github.com/libretro/neocd_libretro"
PKG_URL="$PKG_SITE.git"
PKG_DEPENDS_TARGET="toolchain flac libogg libvorbis"
PKG_PRIORITY="optional"
PKG_SECTION="libretro"
PKG_SHORTDESC="Neo Geo CD emulator for libretro "
PKG_LONGDESC="NeoCD-Libretro is a complete rewrite of NeoCD from scratch in modern C++11. It is designed with accuracy and portability in mind rather than being all about speed like the the older versions. The goal is also to document all I know about the platform in the source code so other emulator authors can make their own implementations."
PKG_IS_ADDON="no"
PKG_TOOLCHAIN="cmake-make"
PKG_AUTORECONF="no"
GET_HANDLER_SUPPORT="git"

make_target() {
  sed -i 's|set(MACHINE_OPTIONS "-march=x86-64 -mtune=generic")|set(MACHINE_OPTIONS "-march=armv8a -mtune=cortex-a53")|' $PKG_BUILD/CMakeLists.txt
  cmake -G "Unix Makefiles" .
  make
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/lib/libretro
  cp $PKG_BUILD/cmake-build-MinSizeRel/output/libneocd_libretro.so $INSTALL/usr/lib/libretro/
}
