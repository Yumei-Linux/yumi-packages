add_source https://www.x.org/pub/individual/lib/libxcvt-0.1.2.tar.xz libxcvt-0.1.2

mkdir -pv build ; cd build

meson setup --prefix=$XORG_PREFIX \
    --buildtype=release \
    ..

ninja && ninja install