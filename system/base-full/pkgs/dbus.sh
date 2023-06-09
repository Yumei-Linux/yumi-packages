source dbus-1.14.6

./configure --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --runstatedir=/run \
    --disable-static \
    --disable-doxygen-docs \
    --disable-xml-docs \
    --docdir=/usr/share/doc/dbus-1.14.6 \
    --with-system-socket=/run/dbus/system_bus_socket

_make && _make install

ln -sfv /etc/machine-id /var/lib/dbus