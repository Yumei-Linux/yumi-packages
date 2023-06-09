into_tar_source glib-2.76.3

patch -Np1 -i ../glib-skip_warnings-1.patch

if [ -e /usr/include/glib-2.0 ]; then
    rm -rf /usr/include/glib-2.0.old
    mv -vf /usr/include/glib-2.0{,.old}
fi

mkdir -pv build ; cd build

meson setup \
    --prefix=/usr \
    --buildtype=release \
    -Dman=true

ninja && ninja install

mkdir -p /usr/share/doc/glib-2.76.3 &&
cp -r ../docs/reference/{gio,glib,gobject} /usr/share/doc/glib-2.76.3