into_tar_source wayland-protocols-1.31
mkdir -pv build ; cd build
meson setup --prefix=/usr --buildtype=release
ninja && ninja install