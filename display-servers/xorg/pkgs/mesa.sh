wget https://www.linuxfromscratch.org/patches/blfs/svn/mesa-add_xdemos-2.patch
wget https://mesa.freedesktop.org/archive/mesa-23.1.1.tar.xz
tar -xvf ./mesa-23.1.1.tar.xz && cd mesa-23.1.1

patch -Np1 -i ../mesa-add_xdemos-2.patch

mkdir -pv build ; cd build

meson setup --prefix=$XORG_PREFIX \
    --buildtype=release \
    -Dplatforms=x11,wayland \
    -Dgallium-drivers=auto \
    -Dvulkan-drivers="" \
    -Dvalgrind=disabled \
    -Dlibunwind=disabled \
    ..

ninja && ninja install

install -v -dm755 /usr/share/doc/mesa-23.1.1 &&
cp -rfv ../docs/* /usr/share/doc/mesa-23.1.1