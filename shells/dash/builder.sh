into_tar_source dash-0.5.12

./configure --bindir=/bin \
    --mandir=/usr/share/man

_make && _make install

echo "[I] Remember to append /bin/dash to /etc/shells!"
