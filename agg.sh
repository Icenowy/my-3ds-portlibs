set -e
export PKG_CONFIG_LIBDIR=/opt/devkitpro/portlibs/3ds/lib/pkgconfig PATH=/opt/devkitpro/devkitARM/bin:/opt/devkitpro/portlibs/3ds/bin:$PATH
wget -c http://www.antigrain.com/agg-2.5.tar.gz -O agg-2.5.tar.gz
tar xvf agg-2.5.tar.gz
cd agg-2.5
sed -i '/AM_C_PROTOTYPES/d' configure.in
sed -i 's@\*m_profile@*((line_profile_aa *)m_profile)@g' include/agg_renderer_outline_aa.h
touch NEWS README AUTHORS COPYING
autoreconf -fi
./configure --host=arm-none-eabi --prefix=/opt/devkitpro/portlibs/3ds --without-x --disable-examples
make $*
make DESTDIR=$PWD/../destdir install
