# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)

PKG_NAME="libxkbcommon"
PKG_VERSION="0.8.4"
PKG_SHA256="60ddcff932b7fd352752d51a5c4f04f3d0403230a584df9a2e0d5ed87c486c8b"
PKG_LICENSE="OSS"
PKG_SITE="http://xkbcommon.org"
PKG_URL="http://xkbcommon.org/download/${PKG_NAME}-${PKG_VERSION}.tar.xz"
PKG_DEPENDS_TARGET="toolchain xkeyboard-config"
PKG_LONGDESC="xkbcommon is a library to handle keyboard descriptions."

PKG_MESON_OPTS_TARGET="-Denable-wayland=false \
                       -Denable-docs=false"

PKG_MESON_OPTS_TARGET+=" -Denable-x11=false"
