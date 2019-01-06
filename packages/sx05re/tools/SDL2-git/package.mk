# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="SDL2-git"
PKG_VERSION="4cd4ad8df6db00989dad155d43a3f13f9ba22f10" # 2.0.9+
PKG_SHA256="b91987e4bd2a3797a842c8a1ee00bd7a7040f419f6e8c0f888689102e8c44930"
PKG_LICENSE="GPL"
PKG_SITE="https://www.libsdl.org/"
PKG_URL="https://github.com/spurious/SDL-mirror/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain nasm:host alsa-lib systemd dbus"
PKG_LONGDESC="SDL2: A cross-platform Graphic API"

# X11 Support
if [ "$DISPLAYSERVER" = "x11" ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET libX11 libXrandr"
  SDL2_SUPPORT_X11="-DVIDEO_X11=ON \
                    -DX11_SHARED=ON \
                    -DVIDEO_X11_XCURSOR=OFF \
                    -DVIDEO_X11_XINERAMA=OFF \
                    -DVIDEO_X11_XINPUT=OFF \
                    -DVIDEO_X11_XRANDR=ON \
                    -DVIDEO_X11_XSCRNSAVER=OFF \
                    -DVIDEO_X11_XSHAPE=OFF \
                    -DVIDEO_X11_XVM=OFF"
else
  SDL2_SUPPORT_X11="-DVIDEO_X11=OFF"
fi

# OpenGL Support
if [ "$OPENGL_SUPPORT" = "yes" ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET $OPENGL"
  SDL2_SUPPORT_OPENGL="-DVIDEO_OPENGL=ON"
else
  SDL2_SUPPORT_OPENGL="-DVIDEO_OPENGL=OFF"
fi

# OpenGLES Support
if [ "$OPENGLES_SUPPORT" = "yes" ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET $OPENGLES"
  SDL2_SUPPORT_OPENGLES="-DVIDEO_OPENGLES=ON"
else
  SDL2_SUPPORT_OPENGLES="-DVIDEO_OPENGLES=OFF"
fi

# RPi Video Support
if [ "$OPENGLES" = "bcm2835-driver" ]; then
  SDL2_SUPPORT_RPI="-DVIDEO_RPI=ON \
                    -DVIDEO_VULKAN=OFF \
                    -DVIDEO_KMSDRM=OFF"
else
  SDL2_SUPPORT_RPI="-DVIDEO_RPI=OFF"
fi

# AML Mali Video Support
if [ "$OPENGLES" = "opengl-meson" ] || [ "$OPENGLES" = "opengl-meson-t82x" ]; then
  SDL2_SUPPORT_MALI="-DVIDEO_MALI=ON \
                     -DVIDEO_VULKAN=OFF \
                     -DVIDEO_KMSDRM=OFF"
else
  SDL2_SUPPORT_MALI="-DVIDEO_MALI=OFF"
fi

# Pulseaudio Support
if [ "$PULSEAUDIO_SUPPORT" = yes ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET pulseaudio"

  SDL2_SUPPORT_PULSEAUDIO="-DPULSEAUDIO=ON \
                           -DPULSEAUDIO_SHARED=ON"
else
  SDL2_SUPPORT_PULSEAUDIO="-DPULSEAUDIO=OFF \
                           -DPULSEAUDIO_SHARED=OFF"
fi

PKG_CMAKE_OPTS_TARGET="-DSDL_STATIC=OFF \
                       -DLIBC=ON \
                       -DGCC_ATOMICS=ON \
                       -DASSEMBLY=ON \
                       -DALTIVEC=OFF \
                       -DOSS=OFF \
                       -DALSA=ON \
                       -DALSA_SHARED=ON \
                       -DESD=OFF \
                       -DESD_SHARED=OFF \
                       -DARTS=OFF \
                       -DARTS_SHARED=OFF \
                       -DNAS=OFF \
                       -DNAS_SHARED=OFF \
                       -DLIBSAMPLERATE=OFF \
                       -DLIBSAMPLERATE_SHARED=OFF \
                       -DSNDIO=OFF \
                       -DDISKAUDIO=OFF \
                       -DDUMMYAUDIO=OFF \
                       -DVIDEO_WAYLAND=OFF \
                       -DVIDEO_WAYLAND_QT_TOUCH=ON \
                       -DWAYLAND_SHARED=OFF \
                       -DVIDEO_MIR=OFF \
                       -DMIR_SHARED=OFF \
                       -DVIDEO_COCOA=OFF \
                       -DVIDEO_DIRECTFB=OFF \
                       -DVIDEO_VIVANTE=OFF \
                       -DDIRECTFB_SHARED=OFF \
                       -DFUSIONSOUND=OFF \
                       -DFUSIONSOUND_SHARED=OFF \
                       -DVIDEO_DUMMY=OFF \
                       -DINPUT_TSLIB=OFF \
                       -DPTHREADS=ON \
                       -DPTHREADS_SEM=ON \
                       -DDIRECTX=OFF \
                       -DSDL_DLOPEN=ON \
                       -DCLOCK_GETTIME=OFF \
                       -DRPATH=OFF \
                       -DRENDER_D3D=OFF \
                       $SDL2_SUPPORT_X11 \
                       $SDL2_SUPPORT_OPENGL \
                       $SDL2_SUPPORT_OPENGLES \
                       $SDL2_SUPPORT_RPI \
                       $SDL2_SUPPORT_MALI \
                       $SDL2_SUPPORT_PULSEAUDIO"

post_makeinstall_target() {
  sed -e "s:\(['=\" ]\)/usr:\\1$SYSROOT_PREFIX/usr:g" -i $SYSROOT_PREFIX/usr/bin/sdl2-config

  rm -rf $INSTALL/usr/bin
}
