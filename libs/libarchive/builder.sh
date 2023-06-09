into_tar_source libarchive-3.6.2

./configure --prefix=/usr \
    --disable-static

_make && _make install
sed -i "s/iconv //" /usr/lib/pkgconfig/libarchive.pc