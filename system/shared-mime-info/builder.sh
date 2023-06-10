into_tar_source shared-mime-info-2.2

mkdir -pv build ; cd build

meson setup --prefix=/usr \
    --buildtype=release \
    -Dupdate-mimedb=true \
    ..

ninja && ninja install