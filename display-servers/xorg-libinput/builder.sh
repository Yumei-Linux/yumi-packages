into_tar_source xf86-input-libinput-1.3.0

./configure --prefix=/usr \ 
    --sysconfdir=/etc \
    --localstatedir=/var \
    --disable-static

_make && _make install