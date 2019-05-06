# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2019-present Shanti Gilbert (https://github.com/shantigilbert)

PKG_NAME="emuelec"
PKG_VERSION=""
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPLv3"
PKG_SITE=""
PKG_URL=""
PKG_DEPENDS_TARGET="toolchain emulationstation retroarch"
PKG_SECTION="emuelec"
PKG_SHORTDESC="EmuELEC Meta Package"
PKG_LONGDESC="EmuELEC Meta Package"
PKG_IS_ADDON="no"
PKG_AUTORECONF="no"
PKG_TOOLCHAIN="make"

# Thanks to magicseb  Reicast SA now WORKS :D
PKG_EMUS="$LIBRETRO_CORES advancemame PPSSPPSDL reicastsa amiberry hatarisa openbor dosbox-sdl2 m64p mupen64plus-nx fba4arm"
PKG_TOOLS="common-shaders scraper Skyscraper MC libretro-bash-launcher fbida mpv SDL_GameControllerDB retropie linux-utils xmlstarlet CoreELEC-Debug-Scripts"
PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET $PKG_EMUS $PKG_TOOLS"
 
# You can build some less used Libretro cores by using $LIBRETRO_EXTRA_CORES but you might run into size problems.
# PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET $LIBRETRO_EXTRA_CORES"

# Uncomment to compile other versions of MAME
 PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET mame2010 mame2014"


make_target() {
if [ "$PROJECT" == "Amlogic-ng" ]; then
	cd $PKG_DIR/fbfix
	$CC -O2 fbfix.c -o fbfix
fi
}

makeinstall_target() {
   
	if [ "$PROJECT" == "Amlogic-ng" ]; then
	mkdir -p $INSTALL/usr/config/emuelec/bin
	cp $PKG_DIR/fbfix/fbfix $INSTALL/usr/config/emuelec/bin
	rm $PKG_DIR/fbfix/fbfix
	fi

  mkdir -p $INSTALL/etc/samba
   cp $PKG_DIR/config/smb.conf $INSTALL/etc/samba

  mkdir -p $INSTALL/usr/config/
    cp -rf $PKG_DIR/config/* $INSTALL/usr/config/
    cp $PKG_DIR/autostart.sh $INSTALL/usr/config/autostart.sh
 
    mkdir -p $INSTALL/usr/config/emuelec/scripts
    cp $PKG_DIR/bin/* $INSTALL/usr/config/emuelec/scripts
    chmod +x $INSTALL/usr/config/emuelec/scripts/*
    
    mkdir -p $INSTALL/usr/bin/
    ln -sf /storage/.config/emuelec/scripts/clearconfig.sh $INSTALL/usr/bin/
    ln -sf /storage/.config/emuelec/scripts/emuelecRunEmu.sh $INSTALL/usr/bin/
    ln -sf /storage/.config/emuelec/scripts/emulationstation.sh $INSTALL/usr/bin/
    ln -sf /storage/.config/emuelec/scripts/emustation-config $INSTALL/usr/bin/
    ln -sf /storage/.config/emuelec/scripts/gamelist-cleaner.sh $INSTALL/usr/bin/
    ln -sf /storage/.config/emuelec/scripts/killes.sh $INSTALL/usr/bin/
    ln -sf /storage/.config/emuelec/scripts/resetfb.sh $INSTALL/usr/bin/
    ln -sf /storage/.config/emuelec/scripts/setres.sh $INSTALL/usr/bin/
    ln -sf /storage/.config/emuelec/scripts/startfe.sh $INSTALL/usr/bin/

    if [ "$PROJECT" != "Amlogic-ng" ]; then
    rm $INSTALL/usr/config/emuelec/scripts/resetfb.sh
    rm $INSTALL/usr/bin/resetfb.sh
    fi 

  mkdir -p $INSTALL/usr/share/retroarch-overlays
    cp -r $PKG_DIR/overlay/* $INSTALL/usr/share/retroarch-overlays
  
  mkdir -p $INSTALL/usr/share/common-shaders
    cp -r $PKG_DIR/shaders/* $INSTALL/usr/share/common-shaders
    
    mkdir -p $INSTALL/usr/share/libretro-database
     touch $INSTALL/usr/share/libretro-database/dummy
}

post_install() {
# Remove unnecesary Retroarch Assets and overlays
rm -rf "$INSTALL/usr/share/retroarch-assets/branding"
rm -rf "$INSTALL/usr/share/retroarch-assets/glui"
rm -rf "$INSTALL/usr/share/retroarch-assets/nuklear"
rm -rf "$INSTALL/usr/share/retroarch-assets/nxrgui"
rm -rf "$INSTALL/usr/share/retroarch-assets/ozone"
rm -rf "$INSTALL/usr/share/retroarch-assets/pkg"
rm -rf "$INSTALL/usr/share/retroarch-assets/switch"
rm -rf "$INSTALL/usr/share/retroarch-assets/wallpapers"
rm -rf "$INSTALL/usr/share/retroarch-assets/zarch"

rm -rf "$INSTALL/usr/share/retroarch-overlays/borders"
rm -rf "$INSTALL/usr/share/retroarch-overlays/effects"
rm -rf "$INSTALL/usr/share/retroarch-overlays/gamepads"
rm -rf "$INSTALL/usr/share/retroarch-overlays/ipad"
rm -rf "$INSTALL/usr/share/retroarch-overlays/keyboards"
rm -rf "$INSTALL/usr/share/retroarch-overlays/misc"

mkdir -p $INSTALL/etc/retroarch-joypad-autoconfig
cp -r $PKG_DIR/gamepads/* $INSTALL/etc/retroarch-joypad-autoconfig

    # link default.target to emuelec.target
   ln -sf emuelec.target $INSTALL/usr/lib/systemd/system/default.target
   enable_service emuelec-autostart.service
   
# Thanks to vpeter we can now have bash :) 
  rm -f $INSTALL/usr/bin/{sh,bash,busybox}
  cp $(get_build_dir busybox)/.install_pkg/usr/bin/busybox $INSTALL/usr/bin
  cp $(get_build_dir bash)/.install_pkg/usr/bin/bash $INSTALL/usr/bin
  ln -sf bash $INSTALL/usr/bin/sh
 
  echo "chmod 4755 $INSTALL/usr/bin/bash" >> $FAKEROOT_SCRIPT
  echo "chmod 4755 $INSTALL/usr/bin/busybox" >> $FAKEROOT_SCRIPT
  find $INSTALL/usr/ -type f -iname "*.sh" -exec chmod +x {} \;
} 
