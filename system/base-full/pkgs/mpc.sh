source mpc-1.3.1

./configure --prefix=/usr \
    --disable-static \
    --docdir=/usr/share/doc/mpc-1.3.1

make && make html
make install && make install-html