source texinfo-7.0.2

./configure --prefix=/usr
make && make install
make TEXMF=/usr/share/texmf install-tex