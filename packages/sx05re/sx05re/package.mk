################################################################################
#      This file is part of sx05re
#      no copyright, do as you please :)
################################################################################

PKG_NAME="sx05re"
PKG_VERSION=""
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPLv3"
PKG_SITE=""
PKG_URL=""
PKG_DEPENDS_TARGET="toolchain retroarch $LIBRETRO_CORES"
PKG_SECTION="sx05re"
PKG_SHORTDESC="Sx05re Meta Package"
PKG_LONGDESC="Sx05re Meta Package"
PKG_IS_ADDON="no"
PKG_AUTORECONF="no"
PKG_TOOLCHAIN="make"
PKG_NEED_UNPACK="$(get_pkg_directory kodi) $(get_pkg_directory CoreELEC-settings)"

# Thanks to magicseb  Reicast SA now WORKS :D
PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET emulationstation advancemame PPSSPPSDL reicastsa common-shaders scraper fbida amiberry MC libretro-bash-launcher hatarisa"

 
# You can build some less used Libretro cores by using $LIBRETRO_EXTRA_CORES but you might run into size problems.
# PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET $LIBRETRO_EXTRA_CORES"

# Uncomment to compile other versions of MAME
# PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET mame2010 mame2014"


make_target() {
  : not
}

makeinstall_target() {
   
  mkdir -p $INSTALL/etc/samba
   cp $PKG_DIR/config/smb.conf $INSTALL/etc/samba

  mkdir -p $INSTALL/usr/config/
    cp -rf $PKG_DIR/config/* $INSTALL/usr/config/
    cp $PKG_DIR/autostart.sh $INSTALL/usr/config/autostart.sh
 
  mkdir -p $INSTALL/usr/bin/
    cp $PKG_DIR/bin/* $INSTALL/usr/bin/
    chmod +x $INSTALL/usr/bin/*

  mkdir -p $INSTALL/usr/share/kodi/addons/
    cp -rf $PKG_DIR/addon/* $INSTALL/usr/share/kodi/addons/

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

  # update addon manifest
   ADDON_MANIFEST=$INSTALL/usr/share/kodi/system/addon-manifest.xml
   xmlstarlet ed -L --subnode "/addons" -t elem -n "addon" -v "script.emulationstation.launcher" $ADDON_MANIFEST
 
 KODI=$INSTALL/usr/lib/systemd/system/kodi.service
 sed -e "s|Wants=network-online.target|Wants=network-online.target\nConditionPathExists=/var/lock/start.kodi|g" -i $KODI
  
 SETTINGS=$INSTALL/usr/share/kodi/addons/service.coreelec.settings/defaults.py
 sed -e "s|UPDATE_REQUEST_URL': 'https://update.coreelec.org/updates.php|UPDATE_REQUEST_URL': 'https://sorry.no.autoupdate|g" -i $SETTINGS
 sed -e "s|'LOCAL_UPDATE_DIR': '/storage/.update/'|'LOCAL_UPDATE_DIR': '/storage/.noupdate/'|g" -i $SETTINGS
 sed -e "/updates = {/{ N; s/updates = {.*'ENABLED': True,/updates = {\n    'ENABLED': False,/;}" -i $SETTINGS


} 
