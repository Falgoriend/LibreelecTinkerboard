################################################################################
#      This file is part of LibreELEC - https://libreelec.tv
#      Copyright (C) 2017 Team LibreELEC
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

PKG_NAME="glmark2"
PKG_VERSION="b7cce86"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/glmark2/glmark2"
PKG_URL="https://github.com/Miouyouyou/glmark2/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain libjpeg-turbo libpng libdrm $OPENGLES"
PKG_SECTION="graphics"
PKG_SHORTDESC="glmark2: glmark2 is an OpenGL 2.0 and ES 2.0 benchmark"
PKG_LONGDESC="glmark2: glmark2 is an OpenGL 2.0 and ES 2.0 benchmark"

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

PKG_CONFIGURE_OPTS_TARGET="--prefix=/usr --with-flavors=drm-glesv2"

configure_target() {
  cd $ROOT/$PKG_BUILD
    LDFLAGS="-lz" ./waf configure $PKG_CONFIGURE_OPTS_TARGET
}

make_target() {
  cd $ROOT/$PKG_BUILD
    ./waf build
}

makeinstall_target() {
  cd $ROOT/$PKG_BUILD
    ./waf install --destdir=$INSTALL
}
