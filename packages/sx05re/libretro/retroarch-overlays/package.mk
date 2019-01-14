# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="lr-common-overlays"
PKG_VERSION="3e9102a717f3e294867d71c674dcebece0bb6cb2"
PKG_SHA256="619d0900a915cf5c27f600ada7b52066247be2f728a3fba0537e4a57dad24a48"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/libretro/common-overlays"
PKG_URL="https://github.com/libretro/common-overlays/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="Collection of overlay files for use with libretro frontends, such as RetroArch."
PKG_TOOLCHAIN="manual"

makeinstall_target() {
  mkdir -p $INSTALL/usr/share/retroarch/overlay
  cp -r $PKG_BUILD/borders $INSTALL/usr/share/retroarch/overlay
}

post_makeinstall_target() {
rm -rf /usr/share/retroarch-overlays/gamepads
rm -rf /usr/share/retroarch-overlays/misc
rm -rf /usr/share/retroarch-overlays/ipad
rm -rf /usr/share/retroarch-overlays/keyboards
}
