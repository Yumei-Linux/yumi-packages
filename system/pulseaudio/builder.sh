into_tar_source pulseaudio-16.1

mkdir -pv build ; cd build

meson setup --prefix=/usr \
    --buildtype=release \
    -Ddatabase=gdbm \
    -Ddoxygen=false \
    -Dbluez5=disabled \
    ..

ninja && ninja install

rm -fv /etc/dbus-1/system.d/pulseaudio-system.conf