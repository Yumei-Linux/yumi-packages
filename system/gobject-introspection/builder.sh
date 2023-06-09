into_tar_source gobject-introspection-1.76.1

mkdir -pv build ; cd build

meson setup --prefix=/usr \
    --buildtype=release \
    ..

ninja && ninja install