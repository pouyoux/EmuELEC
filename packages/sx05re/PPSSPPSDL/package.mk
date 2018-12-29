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

PKG_NAME="PPSSPPSDL"
PKG_VERSION="74d87fa"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="MAME"
PKG_SITE="https://github.com/hrydgard/ppsspp"
PKG_GIT_URL="$PKG_SITE"
PKG_DEPENDS_TARGET="toolchain ffmpeg libzip libpng SDL2-git zlib zip linux"
PKG_SHORTDESC="PPSSPPDL"
PKG_LONGDESC="PPSSPP Standalone"
PKG_IS_ADDON="no"
PKG_AUTORECONF="no"
PKG_TOOLCHAIN="cmake-make"

if [ $ARCH = "arm" ] && [ ! $TARGET_CPU = "arm1176jzf-s" ]; then
  PPSSPP_ARCH_ARM="-DARMV7=ON"
elif [ $TARGET_CPU = "arm1176jzf-s" ]; then
  PPSSPP_ARCH_ARM="-DARM=ON"
fi

if [ $OPENGLES_SUPPORT = "yes" ]; then
  PPSSPP_OPENGLES_SUPPORT="-DUSING_FBDEV=ON \
                           -DUSING_EGL=ON \
                           -DUSING_GLES2=ON"
fi

if [ $DISPLAYSERVER = "x11" ] && [ $VULKAN_SUPPORT = "yes" ]; then
  PPSSPP_VULKAN_SUPPORT="-DUSING_X11_VULKAN=ON"
else
  PPSSPP_VULKAN_SUPPORT="-DUSING_X11_VULKAN=OFF"
fi

PKG_CMAKE_OPTS_TARGET="-DUSE_SYSTEM_FFMPEG=ON \
                       $PPSSPP_ARCH_ARM \
                       $PPSSPP_OPENGLES_SUPPORT \
                       $PPSSPP_VULKAN_SUPPORT"

pre_make_target() {
  find . -name flags.make -exec sed -i "s:isystem :I:g" \{} \;
}


makeinstall_target() {
  mkdir -p $INSTALL/usr/bin
    cp $PKG_DIR/ppsspp.sh $INSTALL/usr/bin/ppsspp.sh
    cp `find . -name "PPSSPPSDL" | xargs echo` $INSTALL/usr/bin/PPSSPPSDL
    cp -r `find . -name "assets" | xargs echo` $INSTALL/usr/bin/
} 
