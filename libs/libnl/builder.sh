into_tar_source libnl-3.7.0

./configure --prefix=/usr \
    --sysconfdir=/etc \
    --disable-static

_make && _make install

mkdir -vp /usr/share/doc/libnl-3.7.0 &&
tar -xf ../libnl-doc-3.7.0.tar.gz --strip-components=1 --no-same-owner \
    -C  /usr/share/doc/libnl-3.7.0