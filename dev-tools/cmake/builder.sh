into_tar_source cmake-3.26.4

sed -i '/"lib64"/s/64//' Modules/GNUInstallDirs.cmake &&

./bootstrap --prefix=/usr \
    --system-libs \
    --mandir=/share/man \
    --no-system-jsoncpp \
    --no-system-librhash \
    --docdir=/share/doc/cmake-3.26.4

_make && _make install