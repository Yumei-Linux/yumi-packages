source tar-1.34

FORCE_UNSAFE_CONFIGURE=1 ./configure \
    --prefix=/usr

_make && _make install
_make -C doc install-html docdir=/usr/share/doc/tar-1.34