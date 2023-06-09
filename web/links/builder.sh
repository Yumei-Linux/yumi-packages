into_tar_source links-2.29

./configure --prefix=/usr \
    --mandir=/usr/share/man

_make && _make install

install -v -d -m755 /usr/share/doc/links-2.29

install -v -m644 doc/links_cal/* KEYS BRAILLE_HOWTO \
    /usr/share/doc/links-2.29