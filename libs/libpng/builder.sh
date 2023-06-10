into_tar_source libpng-1.6.39

gzip -cd ../libpng-1.6.39-apng.patch.gz | patch -p1

./configure --prefix=/usr \
    --disable-static

_make && _make install

mkdir -v /usr/share/doc/libpng-1.6.39 &&
cp -v README libpng-manual.txt /usr/share/doc/libpng-1.6.39