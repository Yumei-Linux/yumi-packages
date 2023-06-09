source xz-5.4.1

./configure --prefix=/usr \
    --disable-static \
    --docdir=/usr/share/doc/xz-5.4.1

_make && _make install