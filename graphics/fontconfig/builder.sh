into_tar_source fontconfig-2.14.2

./configure --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --disable-docs \
    --docdir=/usr/share/doc/fontconfig-2.14.2

_make && _make install

install -v -dm755 \
        /usr/share/{man/man{1,3,5},doc/fontconfig-2.14.2/fontconfig-devel} &&
install -v -m644 fc-*/*.1         /usr/share/man/man1 &&
install -v -m644 doc/*.3          /usr/share/man/man3 &&
install -v -m644 doc/fonts-conf.5 /usr/share/man/man5 &&
install -v -m644 doc/fontconfig-devel/* \
                                  /usr/share/doc/fontconfig-2.14.2/fontconfig-devel &&
install -v -m644 doc/*.{pdf,sgml,txt,html} \
                                  /usr/share/doc/fontconfig-2.14.2