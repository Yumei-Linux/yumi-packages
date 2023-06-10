into_tar_source libepoxy-1.5.10

mkdir -pv build ; cd build

meson setup --prefix=/usr \
    --buildtype=release \
    ..

ninja && ninja install