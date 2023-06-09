into_tar_source libevent-2.1.12-stable

sed -i 's/python/&3/' event_rpcgen.py

./configure --prefix=/usr \
    --disable-static

_make && _make install