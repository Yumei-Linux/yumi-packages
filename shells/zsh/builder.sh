into_tar_source zsh-5.9

./configure --prefix=/usr \
    --sysconfdir=/etc/zsh \
    --enable-etcdir=/etc/zsh \
    --enable-cap \
    --enable-gdbm

_make && _make install

echo "[I] Remember to append /bin/zsh to /etc/shells!"