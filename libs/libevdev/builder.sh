into_tar_source libevdev-1.13.1

mkdir -pv build ; cd build

meson setup \
    --prefix=/usr \
    --buildtype=release \
    -Ddocumentation=disabled \
    ..

ninja && ninja install