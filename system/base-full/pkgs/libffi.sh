source libffi-3.4.4

./configure --prefix=/usr \
    --disable-static \
    --with-gcc-arch=native

_make && _make install