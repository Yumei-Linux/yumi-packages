into_tar_source speex-1.2.1

./configure --prefix=/usr \
    --disable-static \
    --docdir=/usr/share/doc/speex-1.2.1

_make && _make install

cd ..
tar -xvf ./speexdsp-1.2.1.tar.gz
cd speexdsp-1.2.1

./configure --prefix=/usr \
    --disable-static \
    --docdir=/usr/share/doc/speexdsp-1.2.1

_make && _make install