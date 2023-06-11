into_tar_source sdl12-compat-release-1.2.64

mkdir -pv build ; cd build

cmake -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=RELEASE \
    ..

_make && _make install
