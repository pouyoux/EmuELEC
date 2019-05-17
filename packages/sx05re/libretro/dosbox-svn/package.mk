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

PKG_NAME="dosbox-svn"
PKG_VERSION="fd95dbe98d5a60bb34a372800ef91abcd3209db6"
PKG_SHA256="98ade97ffe5ef4e1a95e96e450d9cd00b73cde92e9f6c0d94704867b8e9278f9"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPLv2"
PKG_SITE="https://github.com/fr500/dosbox-svn"
PKG_URL="https://github.com/fr500/dosbox-svn/archive/$PKG_VERSION.zip"
PKG_DEPENDS_TARGET="toolchain SDL SDL_net"
PKG_PRIORITY="optional"
PKG_SECTION="libretro"
PKG_SHORTDESC="Upstream port of DOSBox to libretro"
PKG_LONGDESC="Upstream port of DOSBox to libretro"

PKG_IS_ADDON="no"
PKG_TOOLCHAIN="make"
PKG_AUTORECONF="no"
PKG_BUILD_FLAGS="-lto"

make_target() {
  if [ "$ARCH" = "aarch64" ]; then
    make -C libretro target=arm64 WITH_EMBEDDED_SDL=0
  elif [ "$ARCH" = "arm" ]; then
    make -C libretro target=arm WITH_EMBEDDED_SDL=0
  elif [ "$ARCH" = "x86_64" ]; then
    make -C libretro target=x86_64 WITH_EMBEDDED_SDL=0
  elif [ "$ARCH" = "i386" ]; then 
    make -C libretro target=x86 WITH_EMBEDDED_SDL=0
  else
    make -C libretro WITH_EMBEDDED_SDL=0
  fi
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/lib/libretro
  cp $PKG_BUILD/libretro/dosbox_svn_libretro.so $INSTALL/usr/lib/libretro
}
