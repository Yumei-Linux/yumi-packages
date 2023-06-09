source check-0.15.2

./configure --prefix=/usr \
    --disable-static

_make && _make docdir=/usr/share/doc/check-0.15.2 install