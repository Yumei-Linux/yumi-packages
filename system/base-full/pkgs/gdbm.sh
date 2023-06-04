source gdbm-1.23

./configure --prefix=/usr \
    --disable-static \
    --enable-libgdbm-compat

make && make install