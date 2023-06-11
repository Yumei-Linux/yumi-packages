into_tar_source tiff-4.5.0

mkdir -pv libtiff-build ; cd libtiff-build

cmake -DCMAKE_INSTALL_PREFIX=/usr \
  -DCMAKE_INSTALL_DOCDIR=/usr/share/doc/libtiff-4.5.0 \
  -G Ninja \
  ..

ninja && ninja install
