into_tar_source xinit-1.4.2

./configure --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --disable-static \
    --with-xinitdir=/etc/X11/app-defaults

_make && _make install

/usr/sbin/ldconfig
chmod u+s /usr/libexec/Xorg