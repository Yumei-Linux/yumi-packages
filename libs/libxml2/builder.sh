into_tar_source libxml2-2.10.4

./configure --prefix=/usr \
    --sysconfdir=/etc \
    --disable-static \
    --with-history \
    PYTHON=/usr/bin/python3 \
    --docdir=/usr/share/doc/libxml2-2.10.4

_make && _make install