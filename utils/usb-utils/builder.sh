into_tar_source usbutils-015.tar.gz

autoreconf -fiv

./configure --prefix \
    --datadir=/usr/share/hwdata

_make && _make install

install -dm755 /usr/share/hwdata/ &&
wget http://www.linux-usb.org/usb.ids -O /usr/share/hwdata/usb.ids

echo "[I] Done building, creating a systemd timer to update the usb.ids at Sunday 2:30AM (local time)..."

cat > /usr/lib/systemd/system/update-usbids.service << "EOF"
[Unit]
Description=Update usb.ids file
Documentation=man:lsusb(8)
DefaultDependencies=no
After=local-fs.target network-online.target
Before=shutdown.target

[Service]
Type=oneshot
RemainAfterExit=yes
ExecStart=/usr/bin/wget http://www.linux-usb.org/usb.ids -O /usr/share/hwdata/usb.ids
EOF

cat > /usr/lib/systemd/system/update-usbids.timer << "EOF"
[Unit]
Description=Update usb.ids file weekly

[Timer]
OnCalendar=Sun 03:00:00
Persistent=true

[Install]
WantedBy=timers.target
EOF

systemctl enable update-usbids.timer