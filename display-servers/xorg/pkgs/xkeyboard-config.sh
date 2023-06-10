add_source https://www.x.org/pub/individual/data/xkeyboard-config/xkeyboard-config-2.38.tar.xz xkeyboard-config-2.38
mkdir -pv build ; cd build
meson setup --prefix=$XORG_PREFIX --buildtype=release ..
ninja && ninja install