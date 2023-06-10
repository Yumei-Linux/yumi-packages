into_tar_source gsettings-desktop-schemas-44.0

sed -i -r 's:"(/system):"/org/gnome\1:g' schemas/*.in

mkdir -pv build ; cd build

meson setup --prefix=/usr \
    --buildtype=release \
    ..

ninja && ninja install