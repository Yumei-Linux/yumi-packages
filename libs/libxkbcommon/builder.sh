into_tar_source libxkbcommon-1.5.0

mkdir -pv build ; cd build

meson setup --prefix=/usr \
    --buildtype=release \
    -Denable-docs=false \
    ..

ninja && ninja install