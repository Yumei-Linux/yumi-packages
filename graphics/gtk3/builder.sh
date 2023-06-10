into_tar_source gtk+-3.24.38

mkdir -pv build ; cd build

meson setup --prefix=/usr \
    --buildtype=release \
    -Dman=false \
    -Dbroadway_bakcend=true \
    ..

ninja && ninja install