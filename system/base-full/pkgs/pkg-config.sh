source pkg-config-0.29.2

./configure --prefix=/usr \
    --with-internal-glib \
    --disable-host-tool \
    --docdir=/usr/share/doc/pkg-config-0.29.2

_make && _make install