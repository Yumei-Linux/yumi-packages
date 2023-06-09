source attr-2.5.1

./configure --prefix=/usr \
    --disable-static \
    --sysconfdir=/etc \
    --docdir=/usr/share/doc/attr-2.5.1

_make && _make install