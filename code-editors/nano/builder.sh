into_tar_source nano-7.2

./configure --prefix=/usr \
    --sysconfdir=/etc \
    --enable-utf8 \
    --docdir=/usr/share/doc/nano-7.2

_make && _make install

install -v -m644 doc/{nano.html,sample.nanorc} /usr/share/doc/nano-7.2

echo "[I] Configuring nano"
echo "  * Filling default configuration file"
echo "  * Configuration files are gonna be located at /etc/nanorc and for"
echo "  * user-only it's gonna be ~/.nanorc"

cat > /etc/nanorc << "EOF"
set autoindent
set constantshow
set fill 72
set historylog
set multibuffer
set nohelp
set positionlog
set quickblank
set regexp
EOF