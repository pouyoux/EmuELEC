# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2017-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="libhybris"
PKG_VERSION="400f696"
PKG_SHA256="669f52c5b3acc59dec586a4824381e863c2bdae31239c99a7efa275a145d8343"
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
