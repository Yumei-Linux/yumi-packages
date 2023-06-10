add_source https://www.x.org/pub/individual/lib/libXdmcp-1.1.4.tar.xz libXdmcp-1.1.4

./configure $XORG_CONFIG \
    --docdir=/usr/share/doc/libXdmcp-1.1.4

_make && _make install