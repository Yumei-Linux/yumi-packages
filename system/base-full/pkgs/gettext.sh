source gettext-0.21.1

./configure --prefix=/usr \
    --disable-static \
    --docdir=/usr/share/doc/gettext-0.21.1

make && make install
chmod -v 0755 /usr/lib/preloadable_libintl.so