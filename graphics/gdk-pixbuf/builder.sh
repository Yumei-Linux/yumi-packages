into_tar_source gdk-pixbuf-2.42.10

mkdir -pv build ; cd build

meson setup --prefix=/usr \
    --buildtype=release \
    --wrap-mode=nofallback \
    ..

ninja && ninja install