into_tar_source polkit-122

groupadd -fg 27 polkitd

useradd -c "PolicyKit Daemon Owner" -d /etc/polkit-1 -u 27 \
    -g polkitd -s /bin/false polkitd

mkdir -pv build ; cd build

meson setup .. \
    --prefix=/usr \
    --buildtype=release \
    -Dman=false \
    -Dsession_tracking=libsystemd-login \
    -Dtests=false

ninja && ninja install