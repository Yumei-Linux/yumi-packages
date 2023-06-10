add_source https://www.x.org/pub/individual/xserver/xwayland-23.1.2.tar.xz xwayland-23.1.2

sed -i '/install_man/,$d' meson_build

mkdir -pv build ; cd build

meson setup --prefix=$XORG_PREFIX \
    --buildtype=release \
    -Dxkb_output_dir=/var/lib/xkb \
    ..

ninja && ninja install