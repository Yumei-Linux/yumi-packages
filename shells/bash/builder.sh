into_tar_source bash-5.2.9

./configure --prefix=/usr \
    --build=$(support/config.guess) \
    --without-bash-malloc

_make && _make _install

ln -sv bash /bin/sh