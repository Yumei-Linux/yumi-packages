into_tar_source unzip60

patch -Np1 -i ../unzip-6.0-consolidated_fixes-1.patch

_make -f unix/Makefile generic

_make prefix=/usr MANDIR=/usr/share/man1 \
    -f unix/Makefile install