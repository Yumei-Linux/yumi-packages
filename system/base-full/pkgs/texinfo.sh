source texinfo-7.0.2

./configure --prefix=/usr
_make && _make install
_make TEXMF=/usr/share/texmf install-tex