into_tar_source libjpeg-turbo-2.1.5.1

mkdir -pv build ; cd build

cmake -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=RELEASE \
    -DENABLE_STATIC=FALSE \
    -DCMAKE_INSTALL_DOCDIR=/usr/share/doc/libjpeg-turbo-2.1.5.1 \
    -DCMAKE_INSTALL_DEFAULT_LIBDIR=lib \
    ..

_make && _make install