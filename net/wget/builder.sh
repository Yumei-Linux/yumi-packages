into_tar_source wget-1.21.4

./configure --prefix=/usr \
    --sysconfdir=/etc \
    --with-ssl=openssl

make && make install

cleanup