into_tar_source bash-5.2.15

./configure --prefix=/usr \
    --build=$(support/config.guess) \
    --without-bash-malloc

_make && _make install
[ -f /bin/sh ] && rm /bin/sh
ln -sv bash /bin/sh