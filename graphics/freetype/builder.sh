into_tar_source freetype-2.13.0

tar -xf ../freetype-doc-2.13.0.tar.xz --strip-components=2 -C docs
sed -ri "s:.*(AUX_MODULES.*valid):\1:" modules.cfg
sed -r "s:.*(#.*SUBPIXEL_RENDERING) .*:\1:" \
    -i include/freetype/config/ftoption.h

./configure --prefix=/usr \
    --enable-freetype-config \
    --disable-static

_make && _make install

install -v -m755 -d /usr/share/doc/freetype-2.13.0 &&
cp -v -R docs/* /usr/share/doc/freetype-2.13.0 &&
rm -v /usr/share/doc/freetype-2.13.0/freetype-config.1