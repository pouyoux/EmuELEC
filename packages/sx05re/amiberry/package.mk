# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="amiberry"
PKG_VERSION="b61d7769e54d5f1b5eb4b2e149fac1e29ba572c4" # v2.24+
PKG_ARCH="arm"
PKG_LICENSE="GPLv3"
PKG_SITE="https://github.com/midwan/amiberry"
PKG_URL="https://github.com/midwan/amiberry.git"
PKG_DEPENDS_TARGET="toolchain zlib SDL2-git SDL2_image SDL2_ttf capsimg libxml2 flac mpg123-compat libpng libmpeg2"
PKG_LONGDESC="Amiberry is an optimized Amiga emulator for ARM-based boards."
GET_HANDLER_SUPPORT="git"
PKG_TOOLCHAIN="make"

PKG_MAKE_OPTS_TARGET="all"

pre_make_target() {
  cd $PKG_BUILD
  export SYSROOT_PREFIX=$SYSROOT_PREFIX

  # build amiberry
  if [ "${PROJECT}" = "Amlogic" ]; then
    PKG_MAKE_OPTS_TARGET+=" PLATFORM=aml"
  elif [ "${PROJECT}" = "RPi" ]; then
    case ${DEVICE} in
      RPi)
      PKG_MAKE_OPTS_TARGET+=" PLATFORM=rpi1-sdl2"
        ;;
      RPi2)
      PKG_MAKE_OPTS_TARGET+=" PLATFORM=rpi2-sdl2"
        ;;
    esac
  fi
}

makeinstall_target() {
  # Create directories
  mkdir -p $INSTALL/usr/bin
  mkdir -p $INSTALL/usr/lib
  mkdir -p $INSTALL/usr/config/amiberry
  mkdir -p $INSTALL/usr/config/amiberry/controller

  # Copy ressources
  cp -R $PKG_DIR/config/* $INSTALL/usr/config/amiberry
  cp -R data $INSTALL/usr/config/amiberry/
  ln -s /storage/roms/bios/Kickstarts $INSTALL/usr/config/amiberry/kickstarts
  cp -R savestates $INSTALL/usr/config/amiberry/
  cp -R screenshots $INSTALL/usr/config/amiberry/
  cp -R whdboot $INSTALL/usr/config/amiberry/

  # Create links to Retroarch controller files
  # ln -s /usr/share/retroarch/autoconfig/udev/8Bitdo_Pro_SF30_BT_B.cfg "$INSTALL/usr/config/amiberry/controller/8Bitdo SF30 Pro.cfg"
  # ln -s "/usr/share/retroarch/autoconfig/udev/Pro Controller.cfg" "$INSTALL/usr/config/amiberry/controller/Pro Controller.cfg"

  # Copy binary, scripts & link libcapsimg
  cp amiberry-*-sdl2 $INSTALL/usr/bin/amiberry
  cp $PKG_DIR/scripts/* $INSTALL/usr/bin
  ln -sf /usr/lib/libcapsimage.so.5.1 $INSTALL/usr/config/amiberry/capsimg.so
}
