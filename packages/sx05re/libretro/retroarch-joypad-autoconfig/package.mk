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

PKG_NAME="retroarch-joypad-autoconfig"
PKG_VERSION="29e0f3b9092cd8c2c2f4e05c4c354262918c9235"
PKG_SHA256="f0a1df72159447b0d2540031063097b784d45048329a92e4cfb865e763f5e0e5"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/libretro/retroarch-joypad-autoconfig.git"
PKG_URL="https://github.com/libretro/retroarch-joypad-autoconfig/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="RetroArch joypad autoconfig files"
PKG_TOOLCHAIN="manual"

post_unpack() {
  rm $PKG_BUILD/configure $PKG_BUILD/Makefile
}

makeinstall_target() {
  mkdir -p $INSTALL/etc/retroarch-joypad-autoconfig
  cp -r * $INSTALL/etc/retroarch-joypad-autoconfig
}

post_makeinstall_target () {
  cp -r $PKG_DIR/config/* $INSTALL/etc/retroarch-joypad-autoconfig
}
