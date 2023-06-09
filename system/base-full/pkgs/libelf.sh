source elfutils-0.188

./configure --prefix=/usr \
    --disable-debuginfod \
    --enable-libdebuginfod=dummy

_make
_make -C libelf install
install -vm644 config/libelf.pc /usr/lib/pkgconfig
rm /usr/lib/libelf.a