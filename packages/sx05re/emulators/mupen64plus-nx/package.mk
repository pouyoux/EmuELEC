# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2019-present Shanti Gilbert (https://github.com/shantigilbert)

PKG_NAME="mupen64plus-nx"
PKG_VERSION="1c2029a"
PKG_REV="1"
PKG_ARCH="arm i386 x86_64"
PKG_LICENSE="GPLv2"
PKG_SITE="https://github.com/libretro/mupen64plus-libretro-nx"
PKG_URL="$PKG_SITE/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain nasm:host $OPENGLES"
PKG_PRIORITY="optional"
PKG_SECTION="libretro"
PKG_SHORTDESC="mupen64plus + RSP-HLE + GLideN64 + libretro"
PKG_LONGDESC="mupen64plus + RSP-HLE + GLideN64 + libretro"

PKG_IS_ADDON="no"
PKG_TOOLCHAIN="make"
PKG_AUTORECONF="no"
PKG_BUILD_FLAGS="-lto"

make_target() {
  case $PROJECT in
    RPi|Gamegirl|Slice)
      CFLAGS="$CFLAGS -I$SYSROOT_PREFIX/usr/include/interface/vcos/pthreads \
	              -I$SYSROOT_PREFIX/usr/include/interface/vmcs_host/linux"
      make platform=rpi GLES=1 FORCE_GLES=1 WITH_DYNAREC=arm
      ;;
    RPi2|Slice3)
      CFLAGS="$CFLAGS -I$SYSROOT_PREFIX/usr/include/interface/vcos/pthreads \
                      -I$SYSROOT_PREFIX/usr/include/interface/vmcs_host/linux"
      make platform=rpi2 GLES=1 FORCE_GLES=1 HAVE_NEON=1 WITH_DYNAREC=arm
      ;;
    imx6|Amlogic*)
      CFLAGS="$CFLAGS -DLINUX -DEGL_API_FB"
      CPPFLAGS="$CPPFLAGS -DLINUX -DEGL_API_FB"
      make platform=unix GLES=1 FORCE_GLES=1 HAVE_NEON=1 WITH_DYNAREC=arm
      ;;
    Generic)
      make
      ;;
    OdroidC1)
      make platform=odroid BOARD=ODROID-C1 GLES=1 FORCE_GLES=1 HAVE_NEON=1 WITH_DYNAREC=arm
      ;;
    OdroidXU3)
      make platform=odroid BOARD=ODROID-XU3 GLES=1 FORCE_GLES=1 HAVE_NEON=1 WITH_DYNAREC=arm
      ;;
    ROCK960)
      make platform=unix-gles GLES=1 FORCE_GLES=1 HAVE_NEON=1 WITH_DYNAREC=arm
      ;;
    *)
      make platform=unix-gles GLES=1 FORCE_GLES=1 HAVE_NEON=1 WITH_DYNAREC=arm
      ;;
  esac
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/lib/libretro
  cp mupen64plus_next_libretro.so $INSTALL/usr/lib/libretro/
}
