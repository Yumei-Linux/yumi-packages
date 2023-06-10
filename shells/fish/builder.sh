into_tar_source fish-3.6.1
mkdir -pv build ; cd build
cmake .. -DCMAKE_INSTALL_PREFIX=/usr
_make && _make install
echo "[I] Remember to add /usr/bin/fish at /etc/shells"