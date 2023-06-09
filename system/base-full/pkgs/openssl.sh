source openssl-3.0.8

./config --prefix=/usr \
    --openssldir=/etc/ssl \
    --libdir=lib \
    shared \
    zlib-dynamic

_make
sed -i '/INSTALL_LIBS/s/libcrypto.a libssl.a//' Makefile
_make MANSUFFIX=ssl install
mv -v /usr/share/doc/openssl /usr/share/doc/openssl-3.0.8
cp -vfr doc/* /usr/share/doc/openssl-3.0.8