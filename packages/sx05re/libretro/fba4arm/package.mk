# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2019-present Shanti Gilbert (https://github.com/shantigilbert)

PKG_NAME="fba4arm"
PKG_VERSION="5412d49dcb2bec064e6f93c85d18fbcd3d9f3113"
PKG_SHA256="d5cbaf13d25c76baad3076b974a7bf20732078518c5e82daf1a92a1da5a064c3"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="Non-commercial"
PKG_SITE="https://github.com/SumavisionQ5/FBA4ARM"
PKG_URL="$PKG_SITE/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_PRIORITY="optional"
PKG_SECTION="libretro"
PKG_SHORTDESC="Port of Final Burn Alpha to Libretro (v0.2.97.38). With many hacked roms added by SumavisionQ5"
PKG_LONGDESC="Currently, FB Alpha supports games on Capcom CPS-1 and CPS-2 hardware, SNK Neo-Geo hardware, Toaplan hardware, Cave hardware, and various games on miscellaneous hardware. "

PKG_IS_ADDON="no"
PKG_TOOLCHAIN="make"
PKG_AUTORECONF="no"

make_target() {
  if [ "$ARCH" == "arm" ]; then
    if [[ "$TARGET_FPU" =~ "neon" ]]; then
      make -f makefile.libretro CC=$CC CXX=$CXX HAVE_NEON=1 profile=performance
    else
      make -f makefile.libretro CC=$CC CXX=$CXX profile=performance
    fi
  else
    make -f makefile.libretro CC=$CC CXX=$CXX profile=accuracy
  fi
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/lib/libretro
  cp fbalpha_libretro.so $INSTALL/usr/lib/libretro/fba4arm_libretro.so
}
