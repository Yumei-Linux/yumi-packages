add_source https://www.x.org/pub/individual/xserver/xorg-server-21.1.8.tar.xz xorg-server-21.1.8

mkdir -pv build ; cd build

meson setup \
    --prefix=$XORG_PREFIX \
    --localstatedir=/var \
    -Dsuid_wrapper=true \
    -Dxephyr=true \
    -Dxkb_output_dir=/var/lib/xkb \
    ..

ninja && ninja install

echo "[I] Note that the xorg-server configuration directory is gonna be at /etc/X11/xorg.conf.d"
mkdir -pv /etc/X11/xorg.conf.d