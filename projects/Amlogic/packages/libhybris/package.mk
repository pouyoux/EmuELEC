# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2017-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="libhybris"
PKG_VERSION="e5f73d6"
PKG_SHA256="7e977a1f28e8b8d330e619c1d823a439b7b239f27c31763fc9d83f70a64acfbd"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/libhybris/libhybris"
PKG_URL="https://github.com/libhybris/libhybris/archive/$PKG_VERSION.tar.gz"
PKG_SOURCE_DIR="$PKG_NAME-$PKG_VERSION*/hybris"
PKG_DEPENDS_TARGET="toolchain android-headers"
PKG_LONGDESC="Allows to run bionic-based HW adaptations in glibc systems - libs."
PKG_TOOLCHAIN="autotools"

PKG_CONFIGURE_OPTS_TARGET="--enable-arch=$TARGET_ARCH \
                           --with-default-egl-platform=fbdev \
                           --with-android-headers=$BUILD/android-headers-25 \
                           --with-default-hybris-ld-library-path=/system/lib \
                           --enable-mali-quirks"
