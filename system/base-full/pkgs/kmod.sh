source kmod-30

./configure --prefix=/usr \
    --sysconfdir=/etc \
    --with-openssl \
    --with-xz \
    --with-zstd \
    --with-zlib

_make && _make install

for target in depmod insmod modinfo modprobe rmmod; do
    ln -sfv ../bin/kmod /usr/sbin/$target
done

ln -sfv kmod /usr/bin/lsmod