into_tar_source pango-1.50.14

sed -i '/array-bounds/d' meson.build

mkdir -pv build ; cd build

meson setup --prefix=/usr \
    --buildtype=release \
    --wrap-mode=nofallback \
    ..

ninja && ninja install