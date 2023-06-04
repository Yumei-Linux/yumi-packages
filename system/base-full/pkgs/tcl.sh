mv /sources/tcl8.6.13-src.tar.gz /sources/tcl8.6.13.tar.gz
source tcl8.6.13

SRCDIR=$(pwd)

cd unix

./configure --prefix=/usr \
    --mandir=/usr/share/man

make

sed -e "s|$SRCDIR/unix|/usr/lib|" \
    -e "s|$SRCDIR|/usr/include|" \
    -i tclConfig.sh

sed -e "s|$SRCDIR/unix/pkgs/tdbc1.1.5|/usr/lib/tdbc1.1.5|" \
    -e "s|$SRCDIR/pkgs/tdbc1.1.5/generic|/usr/include|" \
    -e "s|$SRCDIR/pkgs/tdbc1.1.5/library|/usr/lib/tcl8.6|" \
    -e "s|$SRCDIR/pkgs/tdbc1.1.5|/usr/include|" \
    -i pkgs/tdbc1.1.5/tdbcConfig.sh

sed -e "s|$SRCDIR/unix/pkgs/itcl4.2.3|/usr/lib/itcl4.2.3|" \
    -e "s|$SRCDIR/pkgs/itcl4.2.3/generic|/usr/include|" \
    -e "s|$SRCDIR/pkgs/itcl4.2.3|/usr/include|" \
    -i pkgs/itcl4.2.3/itclConfig.sh

unset SRCDIR

make install
chmod -v u+w /usr/lib/libtcl8.6.so
make install-private-headers