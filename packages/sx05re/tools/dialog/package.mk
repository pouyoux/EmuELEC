# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)
# Copyright (C) 2019-present Team CoreELEC (https://coreelec.org)

# https://invisible-mirror.net/archives/dialog/dialog-1.3-20190211.tgz
PKG_NAME="dialog"
PKG_VERSION="1.3-20190211"
PKG_SHA256=""
PKG_LICENSE="LGPL-2.1"
PKG_SITE="https://invisible-mirror.net/archives/dialog"
PKG_URL="$PKG_SITE/dialog-$PKG_VERSION.tgz"
PKG_DEPENDS_TARGET="toolchain ncurses"
PKG_LONGDESC="Video player based on MPlayer/mplayer2 https://mpv.io"
PKG_TOOLCHAIN="auto"

PKG_CONFIGURE_OPTS_TARGET="--with-ncurses --disable-rpath-hack"


