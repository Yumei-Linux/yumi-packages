into_tar_source newt-0.52.23

sed -e '/install -m 644 $(LIBNEWT)/ s/^/#/' \
    -e '/$(LIBNEWT):/,/rv/ s/^/#/'          \
    -e 's/$(LIBNEWT)/$(LIBNEWTSH)/g'        \
    -i Makefile.in

./configure --prefix=/usr \
    --with-gpm-support \
    --with-python=python3.11

_make && _make install