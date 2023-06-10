into_tar_source at-spi2-core-2.48.3

mkdir -pv build ; cd build

meson setup --prefix=/usr \
    --buildtype=release \
    ..

ninja && ninja install