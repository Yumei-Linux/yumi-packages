into_tar_source libndp-1.8

./configure --prefix=/usr \
    --sysconfidr=/etc \
    --localstatedir=/var \
    --disable-static

_make && _make install