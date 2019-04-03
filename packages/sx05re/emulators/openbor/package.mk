# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2019-present CoreELEC (https://coreelec.org)

PKG_NAME="openbor"
PKG_VERSION="21e153f55ce640ebe99b68007faf83fe29d56e09"
PKG_SHA256="6153823e2ebf544c633bf164bc3277475e4ecf60ae9826d739add134d4443f0b"
PKG_ARCH="any"
PKG_SITE="https://github.com/DCurrent/openbor"
PKG_URL="$PKG_SITE/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain SDL2-git libvorbisidec libogg libvpx gl4es"
PKG_SHORTDESC="OpenBOR is the ultimate 2D side scrolling engine for beat em' ups, shooters, and more! "
PKG_LONGDESC="OpenBOR is the ultimate 2D side scrolling engine for beat em' ups, shooters, and more! "
PKG_TOOLCHAIN="manual"

pre_configure_target() {
 cd ..
 rm -rf .$TARGET_NAME
}

make_target() {
cd $PKG_BUILD/engine
  make CC=$CC CXX=$CXX AS=$CC BUILD_PANDORA=1
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/bin
    cp `find . -name "OpenBOR.elf" | xargs echo` $INSTALL/usr/bin/OpenBOR
   } 
