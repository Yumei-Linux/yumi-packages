add_source https://xorg.freedesktop.org/archive/individual/proto/xorgproto-2023.1.tar.xz xorgproto-2023.1

mkdir -pv build ; cd build

meson setup --prefix=$XORG_PREFIX \
    -Dlegacy=true \
    ..

ninja && ninja install

mv -v $XORG_PREFIX/share/doc/xorgproto{,-2023.1}