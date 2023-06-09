source Python-3.11.2

./configure --prefix=/usr \
    --enable-shared \
    --without-ensurepip

_make && _make install