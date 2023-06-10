into_tar_source pixman-0.42.2

mkdir -pv build ; cd build

meson setup --prefix=/usr \
    --buildtype=release

ninja && ninja install