add_source https://dri.freedesktop.org/libdrm/libdrm-2.4.115.tar.xz libdrm-2.4.115

mkdir -pv build ; cd build

meson setup --prefix=$XORG_PREFIX \
    --buildtype=release \
    -Dudev=true \
    -Dvalgrind=disabled \
    ..

ninja && ninja install