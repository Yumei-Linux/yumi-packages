into_tar_source wayland-1.22.0

mkdir -pv build ; cd build

meson setup .. \
    --prefix=/usr \
    --buildtype=release \
    -Ddocumentation=false

ninja && ninja install