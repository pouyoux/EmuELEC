# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)
# Copyright (C) 2019-present Team CoreELEC (https://coreelec.org)

PKG_NAME="mpv"
PKG_VERSION="dd83b66652d93e5422757f569b084867a9052e48"
PKG_SHA256=""
PKG_LICENSE="GPLv3+"
PKG_SITE="https://github.com/mpv-player/mpv"
PKG_URL="$PKG_SITE/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain Python2 SDL2-git"
PKG_LONGDESC="Video player based on MPlayer/mplayer2 https://mpv.io"
PKG_BUILD_FLAGS="-gold"
PKG_TOOLCHAIN="manual"

configure_target() {
  ./bootstrap.py
  ./waf configure --enable-mali-fbdev --enable-sdl2 --disable-pulse --disable-libbluray
}

make_target() {
  ./waf build
}

makeinstall_target() {
  #./waf install --destdir=$INSTALL --targets=mpv -j$CONCURRENCY_MAKE_LEVEL
  mkdir -p $INSTALL/usr/bin
  cp ./build/mpv $INSTALL/usr/bin
}
