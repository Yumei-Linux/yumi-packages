into_tar_source xf86-video-vmware-13.4.0

./configure --prefix=/usr \
    --disable-static \
    --localstatedir=/var \
    --sysconfdir=/etc

_make && _make install