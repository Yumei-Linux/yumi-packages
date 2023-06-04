source binutils-2.40

mkdir -pv build ; cd build

../configure --prefix=/usr \
    --sysconfdir=/etc \
    --enable-gold \
    --enable-ld=default \
    --enable-plugins \
    --enable-shared \
    --disable-werror \
    --enable-64-bit-bfd \
    --with-system-zlib

make tooldir=/usr
make tooldir=/usr install

rm -fv /usr/lib/lib{bfd,ctf,ctf-nobfd,sframe,opcodes}.a
rm -fv /usr/share/man/man1/{gprofng,gp-*}.1