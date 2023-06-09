into_tar_source curl-8.1.1

./configure --prefix=/usr \
    --disable-static \
    --with-openssl \
    --enable-threaded-resolver \
    --with-ca-path=/etc/ssl/certs

_make && _make install

rm -rf docs/examples/.deps
find docs \( -name Makefile\* -o -name \*.1 -o -name \*.3 \) -exec rm {} \;
install -v -d -m755 /usr/share/doc/curl-8.1.1
cp -v -R docs/* /usr/share/doc/curl-8.1.1

