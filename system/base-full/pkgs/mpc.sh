source mpc-1.3.1

./configure --prefix=/usr \
    --disable-static \
    --docdir=/usr/share/doc/mpc-1.3.1

_make && _make html
_make install && _make install-html