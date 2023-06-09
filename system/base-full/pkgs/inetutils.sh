source inetutils-2.4

./configure --prefix=/usr \
    --bindir=/usr/bin \
    --localstatedir=/var \
    --disable-logger \
    --disable-whois \
    --disable-rcp \
    --disable-rexec \
    --disable-rlogin \
    --disable-rsh \
    --disable-servers

_make && _make install

mv -v /usr/{,s}bin/ifconfig