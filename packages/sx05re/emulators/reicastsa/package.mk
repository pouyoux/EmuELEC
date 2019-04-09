################################################################################
#      This file is part of LibreELEC - http://www.libreelec.tv
#      Copyright (C) 2016 Team LibreELEC
#
#  LibreELEC is free software: you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation, either version 2 of the License, or
#  (at your option) any later version.
#
#  LibreELEC is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with LibreELEC.  If not, see <http://www.gnu.org/licenses/>.
################################################################################

PKG_NAME="reicastsa"
PKG_VERSION="7e11e7aff6d704de4ad8ad7531f597df058099ac"
PKG_SHA256="07978933e040470b1fbb8c887485703f10fb828b583b350e23e834e7b8cee4bc"
PKG_ARCH="any"
PKG_LICENSE="GPLv2"
PKG_SITE="https://github.com/reicast/reicast-emulator"
PKG_URL="https://github.com/reicast/reicast-emulator/archive/$PKG_VERSION.tar.gz"
PKG_SOURCE_DIR="reicast-emulator-$PKG_VERSION*"
PKG_DEPENDS_TARGET="toolchain alsa libpng libevdev libX11 python-evdev pulseaudio"
PKG_SHORTDESC="Reicast is a multi-platform Sega Dreamcast emulator"
PKG_TOOLCHAIN="make"
PKG_BUILD_FLAGS="-gold"

make_target() {
  cd shell/linux
      make CC=$CC CXX=$CXX AS=$CC STRIP=$STRIP platform=odroidc2 reicast.elf USE_PULSEAUDIO=1
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/bin
  cp reicast.elf $INSTALL/usr/bin/reicast
  cp tools/reicast-joyconfig.py $INSTALL/usr/bin/
  cp -r $PKG_DIR/scripts/* $INSTALL/usr/bin/

  mkdir -p $INSTALL/usr/config
  cp -r $PKG_DIR/config/* $INSTALL/usr/config/
 
}
