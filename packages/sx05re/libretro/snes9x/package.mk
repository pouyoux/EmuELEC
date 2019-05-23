################################################################################
#      This file is part of OpenELEC - http://www.openelec.tv
#      Copyright (C) 2009-2012 Stephan Raue (stephan@openelec.tv)
#
#  This Program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 2, or (at your option)
#  any later version.
#
#  This Program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with OpenELEC.tv; see the file COPYING.  If not, write to
#  the Free Software Foundation, 51 Franklin Street, Suite 500, Boston, MA 02110, USA.
#  http://www.gnu.org/copyleft/gpl.html
################################################################################

PKG_NAME="snes9x"
PKG_VERSION="66f1ac2abc2a201b8cbc41a3a85fb95b2c60d26a"
PKG_SHA256="822f6aeb186a9b91a5860ee11e5ed935fc9b70eb01ac99b586ec62a2532b8c07"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="Non-commercial"
PKG_SITE="https://github.com/snes9xgit/snes9x"
PKG_URL="$PKG_SITE/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_PRIORITY="optional"
PKG_SECTION="libretro"
PKG_SHORTDESC="Snes9x - Portable Super Nintendo Entertainment System (TM) emulator"
PKG_LONGDESC="Snes9x - Portable Super Nintendo Entertainment System (TM) emulator"

PKG_IS_ADDON="no"
PKG_TOOLCHAIN="make"
PKG_AUTORECONF="no"

make_target() {
  if [ "$ARCH" == "arm" ]; then
    CXXFLAGS="$CXXFLAGS -DARM"
  fi
  make -C libretro
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/lib/libretro
  cp libretro/snes9x_libretro.so $INSTALL/usr/lib/libretro/
}
