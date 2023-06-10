into_tar_source xf86-video-intel-20230223

./autogen.sh --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --disable-static \
    --enable-kms-only \
    --enable-uxa \
    --mandir=/usr/share/man

_make && _make install

mv -v /usr/share/man/man4/intel-virtual-output.4 \
    /usr/share/man/man1/intel-virtual-output.1

sed -i '/\.TH/s/4/1/' /usr/share/man/man1/intel-virtual-output.1