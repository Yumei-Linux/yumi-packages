into_tar_source dbus-1.14.6

./configure --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --runstatedir=/run \
    --enable-user-session \
    --disable-doxygen-docs \
    --disable-xml-docs \
    --disable-static \
    --docdir=/usr/share/doc/dbus-1.14.6 \
    --with-system-socket=/run/dbus/system_bus_socket

_make && _make install

echo "[I] Configuring dbus"

cat > /etc/dbus-1/session-local.conf << "EOF"
<!DOCTYPE busconfig PUBLIC
 "-//freedesktop//DTD D-BUS Bus Configuration 1.0//EN"
 "http://www.freedesktop.org/standards/dbus/1.0/busconfig.dtd">
<busconfig>

  <!-- Search for .service files in /usr/local -->
  <servicedir>/usr/local/share/dbus-1/services</servicedir>

</busconfig>
EOF

echo "  * Use dbus-launch to launch X graphical environments + DBus"