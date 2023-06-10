into_tar_source libinput-1.23.0

mkdir -pv build ; cd build

meson setup --prefix=/usr \
    --buildtype=release \
    -Ddebug-gui=false \
    -Dtests=false \
    -Dlibwacom=false \
    -Dudev-dir=/usr/lib/udev \
    ..

ninja && ninja install