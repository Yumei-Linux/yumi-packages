source gdbm-1.23

./configure --prefix \
    --disable-static \
    --enable-libgdbm-compat

make && make install