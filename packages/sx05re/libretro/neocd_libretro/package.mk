# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2019-present Team CoreELEC (https://coreelec.org)

PKG_NAME="neocd_libretro"
PKG_VERSION="fd77de0d3f557f9d92a78c7bdda44c207f992ab5"
PKG_SHA256="a8ebab13aff6781ce37780f21da59cb58ecca42915c8a0a25c3cc4790e469f2b"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="LGPLv3.0"
PKG_SITE="https://github.com/libretro/neocd_libretro"
PKG_URL="$PKG_SITE/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain flac libogg libvorbis"
PKG_PRIORITY="optional"
PKG_SECTION="libretro"
PKG_SHORTDESC="Neo Geo CD emulator for libretro "
PKG_LONGDESC="NeoCD-Libretro is a complete rewrite of NeoCD from scratch in modern C++11. It is designed with accuracy and portability in mind rather than being all about speed like the the older versions. The goal is also to document all I know about the platform in the source code so other emulator authors can make their own implementations."
PKG_IS_ADDON="no"
PKG_TOOLCHAIN="cmake-make"
PKG_AUTORECONF="no"

make_target() {
  cmake -G "Unix Makefiles" .
  make
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/lib/libretro
  cp $PKG_BUILD/cmake-build-MinSizeRel/output/libneocd_libretro.so $INSTALL/usr/lib/libretro/
}
