into_tar_source libwebp-1.3.0

patch -Np1 -i ../libwebp-1.3.0-upstream_fix-1.patch

./configure --prefix=/usr \
  --enable-libwebpmux \
  --enable-libwebpdemux \
  --enable-libwebpdecoder \
  --enable-libwebpextras \
  --enable-swap-16bit-csp \
  --disable-static

_make && _make install
