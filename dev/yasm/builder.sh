into_tar_source yasm-1.3.0
sed -i 's#) ytasm.*#)#' Makefile.in
./configure --prefix=/usr
_make && _make install