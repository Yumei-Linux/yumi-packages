add_source https://xorg.freedesktop.org/archive/individual/lib/libxcb-1.15.tar.xz libxcb-1.15

PYTHON=python3 ./configure $XORG_CONFIG \
    --without-doxygen \
    --docdir='${datadir}'/doc/libxcb-1.15

_make && _make install