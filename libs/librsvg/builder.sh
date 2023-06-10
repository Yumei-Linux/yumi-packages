into_tar_source librsvg-2.56.1

./configure --prefix=/usr \
    --disable-static \
    --enable-vala \
    --disable-gtk-doc

_make && _make install