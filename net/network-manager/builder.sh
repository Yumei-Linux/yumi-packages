into_tar_source NetworkManager-1.42.6

grep -rl '^#!.*python$' | xargs sed -i '1s/python/&3/'

mkdir -pv build ; cd build

CXXFLAGS+="-O2 -fPIC"

meson setup --prefix=/usr \
    --buildtype=release \
    -Dlibaudit=no \
    -Dlibpsl=false \
    -Dnmtui=true \
    -Dovs=false \
    -Dppp=false \
    -Dselinux=false \
    -Dqt=false \
    -Dsession_tracking=systemd \
    -Dmodem_manager=false \
    ..

ninja && ninja install

mv -v /usr/share/doc/NetworkManager{,-1.42.6}
cp -Rv ../docs/{api,libnm} /usr/share/doc/NetworkManager-1.42.6

echo "[I] Configuring Network Manager..."

cat >> /etc/NetworkManager/NetworkManager.conf << "EOF"
[main]
plugins=keyfile
EOF

cat > /etc/NetworkManager/conf.d/polkit.conf << "EOF"
[main]
auth-polkit=true
EOF

groupadd -fg 86 netdev

echo "  * Note: Add your regular user to the 'netdev' group to allow them manager network connections"

cat > /usr/share/polkit-1/rules.d/org.freedesktop.NetworkManager.rules << "EOF"
polkit.addRule(function(action, subject) {
    if (action.id.indexOf("org.freedesktop.NetworkManager.") == 0 && subject.isInGroup("netdev")) {
        return polkit.Result.YES;
    }
});
EOF

echo "[S] Configuration of Network Manager was performed successfully, but there are some notes:"

cat << EOF
  * In order to enable NetworkManager at boot, run
  * $ systemctl enable NetworkManager
  * Starting in version 1.11.2 of NetworkManager, a systemd unit named
  * NetworkManager-wait-online.service is enabled, which is used to prevent
  * services that require network connectivity from starting until NetworkManager
  * establishes a connection. To disable this behavior, run the following command as
  * the root user:
  * $ systemctl disable Networkmanager-wait-online
EOF