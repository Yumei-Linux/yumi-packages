source bash-5.2.15

./configure --prefix=/usr \
    --without-bash-malloc \
    --with-installed-readline \
    --docdir=/usr/share/doc/bash-5.2.15

_make && _make install