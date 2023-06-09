into_tar_source libxslt-1.1.38

./configure --prefix=/usr \
    --disable-static \
    --docdir=/usr/share/doc/libxslt-1.1.38 \
    PYTHON=/usr/bin/python3

_make && _make install