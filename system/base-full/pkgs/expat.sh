source expat-2.5.0

./configure --prefix=/usr \
    --disable-static \
    --docdir=/usr/share/doc/expat-2.5.0

make && make install

install -v -m644 doc/*.{html,css} /usr/share/doc/expat-2.5.0