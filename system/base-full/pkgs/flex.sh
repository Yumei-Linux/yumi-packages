source flex-2.6.4

./configure --prefix=/usr \
    --docdir=/usr/share/doc/flex-2.6.4 \
    --disable-static

_make && _make install

ln -sv flex /usr/bin/lex