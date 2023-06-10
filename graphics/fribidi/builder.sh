into_tar_source fribidi-1.0.13

mkdir -pv build ; cd build

meson setup --prefix=/usr \
    --buildtype=release \
    ..

ninja && ninja install