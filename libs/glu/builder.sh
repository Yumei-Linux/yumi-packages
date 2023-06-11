into_tar_source glu-9.0.2

mkdir -pv build ; cd build

meson --prefix=/usr \
    -Dgl_provider=gl \
    --buildtype=release \
    ..

ninja && ninja install
rm -rf /usr/lib/libGLU.a
